module "this_label" {
  source     = "r0ck40k/label/generic"
  version    = "0.1.0"
  context    = var.context
  attributes = ["redis", "cluster", var.name]
}

resource "aws_elasticache_replication_group" "redis" {
  engine                        = var.global_replication_group_id == null ? "redis" : null
  parameter_group_name          = var.global_replication_group_id == null ? aws_elasticache_parameter_group.redis.name : null
  subnet_group_name             = aws_elasticache_subnet_group.redis.name
  security_group_ids            = concat(var.security_group_ids, [module.security-group.id])
  availability_zones            = var.availability_zones
  replication_group_id          = var.global_replication_group_id == null ? module.this_label.id : "${module.this_label.id}-replica"
  number_cache_clusters         = var.cluster_mode_enabled ? null : var.number_cache_clusters
  node_type                     = var.global_replication_group_id == null ? var.node_type : null
  engine_version                = var.global_replication_group_id == null ? var.engine_version : null
  port                          = var.port
  maintenance_window            = var.maintenance_window
  snapshot_window               = var.snapshot_window
  snapshot_retention_limit      = var.snapshot_retention_limit
  final_snapshot_identifier     = var.final_snapshot_identifier
  automatic_failover_enabled    = var.automatic_failover_enabled && var.number_cache_clusters > 1 ? true : false
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  multi_az_enabled              = var.multi_az_enabled
  at_rest_encryption_enabled    = var.global_replication_group_id == null ? var.at_rest_encryption_enabled : null
  transit_encryption_enabled    = var.global_replication_group_id == null ? var.transit_encryption_enabled : null
  auth_token                    = var.auth_token != "" ? var.auth_token : null
  kms_key_id                    = var.kms_arn
  global_replication_group_id   = var.global_replication_group_id
  apply_immediately             = var.apply_immediately
  replication_group_description = var.description
  notification_topic_arn        = var.notification_topic_arn
  dynamic "cluster_mode" {
    for_each = var.cluster_mode_enabled ? [1] : []
    content {
      replicas_per_node_group = var.replicas_per_node_group
      num_node_groups         = var.num_node_groups
    }
  }
  tags = merge(
    {
      "Name" = module.this_label.id
    }
  )
}
resource "random_id" "redis_pg" {
  keepers = {
    family = var.family
  }
  byte_length = 2
}
resource "aws_elasticache_parameter_group" "redis" {
  name        = module.this_label.id
  family      = var.family
  description = var.description
  dynamic "parameter" {
    for_each = var.cluster_mode_enabled ? concat([
      { name = "cluster-enabled", value = "yes" }
    ], var.parameter) : var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_elasticache_subnet_group" "redis" {
  name        = var.global_replication_group_id == null ? module.this_label.id : "${module.this_label.id}-replica"
  subnet_ids  = var.subnet_ids
  description = var.description
}

module "security-group" {
  source             = "r0ck40k/security-group/aws"
  version            = "0.1.0"
  description        = "access group for elasticache ${var.name}"
  allow_self_ingress = true
  context            = var.context
  ingress = {
    redis = {
      from        = var.port
      to          = var.port
      protocol    = "tcp"
      cidr_blocks = var.ingress_cidr_blocks
    }
  }
  egress = {
    any = {
      to          = 0
      from        = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
  name   = var.name
  vpc_id = var.vpc_id
}
