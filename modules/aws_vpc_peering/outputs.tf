# output "peering_id" {
#   value = aws_vpc_peering_connection.peering.id
# }
#  output "name" {
#    value = aws_vpc_peering_connection.peering.accept_status
#  }
# count creates a list, even if it contains only one element.
# aws_vpc_peering_connection.peering.id is invalid, because peering is a list.
# aws_vpc_peering_connection.peering[0].id is valid, because it properly accesses the first element.
# length(... ) > 0 ? ... : null prevents errors if count = 0

output "peering_id" {
  value = length(aws_vpc_peering_connection.peering) > 0 ? aws_vpc_peering_connection.peering[0].id : null
}

output "accept_status" {
  value = length(aws_vpc_peering_connection.peering) > 0 ? aws_vpc_peering_connection.peering[0].accept_status : null
}
