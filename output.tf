output "elasticache_replication_group_arn" {
  value       = aws_elasticache_replication_group.redis.arn
  description = "The Amazon Resource Name (ARN) of the created ElastiCache Replication Group."
}
output "elasticache_replication_group_id" {
  value       = aws_elasticache_replication_group.redis.id
  description = "The ID of the ElastiCache Replication Group."
}
output "elasticache_replication_group_primary_endpoint_address" {
  value       = var.cluster_mode_enabled ? aws_elasticache_replication_group.redis.configuration_endpoint_address : aws_elasticache_replication_group.redis.primary_endpoint_address
  description = "The address of the endpoint for the primary node in the replication group."
}
output "elasticache_replication_group_reader_endpoint_address" {
  value       = var.cluster_mode_enabled ? aws_elasticache_replication_group.redis.configuration_endpoint_address : aws_elasticache_replication_group.redis.reader_endpoint_address
  description = "The address of the endpoint for the reader node in the replication group."
}
output "elasticache_replication_group_member_clusters" {
  value       = aws_elasticache_replication_group.redis.member_clusters
  description = "The identifiers of all the nodes that are part of this replication group."
}
output "elasticache_parameter_group_id" {
  value       = aws_elasticache_parameter_group.redis.id
  description = "The ElastiCache parameter group name."
}
output "security_group_id" {
  value       = module.security-group.id
  description = "The ID of the Redis ElastiCache security group."
}
output "security_group_arn" {
  value       = module.security-group.arn
  description = "The ARN of the Redis ElastiCache security group."
}
output "security_group_name" {
  value       = module.security-group.name
  description = "The name of the Redis ElastiCache security group."
}
output "elasticache_auth_token" {
  description = "The Redis Auth Token."
  value       = aws_elasticache_replication_group.redis.auth_token
  sensitive   = true
}
output "elasticache_port" {
  description = "The Redis port."
  value       = aws_elasticache_replication_group.redis.port
}
