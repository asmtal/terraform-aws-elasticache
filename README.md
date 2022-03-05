<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security-group"></a> [security-group](#module\_security-group) | r0ck40k/security-group/aws | 0.1.0 |
| <a name="module_this_label"></a> [this\_label](#module\_this\_label) | r0ck40k/label/generic | 0.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_parameter_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_replication_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [random_id.redis_pg](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled) | Whether to enable encryption at rest. | `bool` | `true` | no |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | The password used to access a password protected server. Can be specified only if `transit_encryption_enabled = true`. | `string` | `""` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Allow automatic  minor upgrades during maintenance window | `string` | `true` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. | `bool` | `true` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | A list of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important. | `list(string)` | `null` | no |
| <a name="input_cluster_mode_enabled"></a> [cluster\_mode\_enabled](#input\_cluster\_mode\_enabled) | Enable creation of a native redis cluster. | `bool` | `false` | no |
| <a name="input_context"></a> [context](#input\_context) | Default environmental context | <pre>object({<br>    organization = string<br>    environment  = string<br>    account      = string<br>    product      = string<br>    tags         = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the all resources. | `string` | `"Managed by Terraform"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version number of the cache engine to be used for the cache clusters in this replication group. | `string` | `"5.0.6"` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the ElastiCache parameter group. | `string` | `"redis5.0"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster. If omitted, no final snapshot will be made. | `string` | `null` | no |
| <a name="input_global_replication_group_id"></a> [global\_replication\_group\_id](#input\_global\_replication\_group\_id) | The ID of the global replication group to which this replication group should belong. | `string` | `null` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | List of Ingress CIDR blocks. | `list(string)` | `[]` | no |
| <a name="input_ingress_self"></a> [ingress\_self](#input\_ingress\_self) | Specify whether the security group itself will be added as a source to the ingress rule. | `bool` | `false` | no |
| <a name="input_kms_arn"></a> [kms\_arn](#input\_kms\_arn) | The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if `at_rest_encryption_enabled = true` | `string` | `""` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Specifies the weekly time range for when maintenance on the cache cluster is performed. | `string` | `""` | no |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | Specifies whether to enable Multi-AZ Support for the replication group. If true, `automatic_failover_enabled` must also be enabled. Defaults to false. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The replication group identifier. This parameter is stored as a lowercase string. | `string` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The compute and memory capacity of the nodes in the node group. | `string` | n/a | yes |
| <a name="input_notification_topic_arn"></a> [notification\_topic\_arn](#input\_notification\_topic\_arn) | An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: `arn:aws:sns:us-east-1:012345678999:my_sns_topic` | `string` | `""` | no |
| <a name="input_num_node_groups"></a> [num\_node\_groups](#input\_num\_node\_groups) | Required when `cluster_mode_enabled` is set to true. Specify the number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications. | `number` | `0` | no |
| <a name="input_number_cache_clusters"></a> [number\_cache\_clusters](#input\_number\_cache\_clusters) | The number of cache clusters (primary and replicas) this replication group will have. | `number` | n/a | yes |
| <a name="input_parameter"></a> [parameter](#input\_parameter) | A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_port"></a> [port](#input\_port) | The port number on which each of the cache nodes will accept connections. | `number` | `6379` | no |
| <a name="input_replicas_per_node_group"></a> [replicas\_per\_node\_group](#input\_replicas\_per\_node\_group) | Required when `cluster_mode_enabled` is set to true. Specify the number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource. | `number` | `0` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of Security Groups. | `list(string)` | `[]` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. | `number` | `30` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. | `string` | `""` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of VPC Subnet IDs for the cache subnet group. | `list(string)` | n/a | yes |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | Whether to enable encryption in transit. | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC Id to associate with Redis ElastiCache. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticache_auth_token"></a> [elasticache\_auth\_token](#output\_elasticache\_auth\_token) | The Redis Auth Token. |
| <a name="output_elasticache_parameter_group_id"></a> [elasticache\_parameter\_group\_id](#output\_elasticache\_parameter\_group\_id) | The ElastiCache parameter group name. |
| <a name="output_elasticache_port"></a> [elasticache\_port](#output\_elasticache\_port) | The Redis port. |
| <a name="output_elasticache_replication_group_arn"></a> [elasticache\_replication\_group\_arn](#output\_elasticache\_replication\_group\_arn) | The Amazon Resource Name (ARN) of the created ElastiCache Replication Group. |
| <a name="output_elasticache_replication_group_id"></a> [elasticache\_replication\_group\_id](#output\_elasticache\_replication\_group\_id) | The ID of the ElastiCache Replication Group. |
| <a name="output_elasticache_replication_group_member_clusters"></a> [elasticache\_replication\_group\_member\_clusters](#output\_elasticache\_replication\_group\_member\_clusters) | The identifiers of all the nodes that are part of this replication group. |
| <a name="output_elasticache_replication_group_primary_endpoint_address"></a> [elasticache\_replication\_group\_primary\_endpoint\_address](#output\_elasticache\_replication\_group\_primary\_endpoint\_address) | The address of the endpoint for the primary node in the replication group. |
| <a name="output_elasticache_replication_group_reader_endpoint_address"></a> [elasticache\_replication\_group\_reader\_endpoint\_address](#output\_elasticache\_replication\_group\_reader\_endpoint\_address) | The address of the endpoint for the reader node in the replication group. |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | The ARN of the Redis ElastiCache security group. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the Redis ElastiCache security group. |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | The name of the Redis ElastiCache security group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-disable -->
<!-- prettier-ignore-end -->
