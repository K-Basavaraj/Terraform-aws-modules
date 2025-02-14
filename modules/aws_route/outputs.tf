output "route_id" {
  value       = aws_route.route.id
  description = "Route identifier computed from the routing table identifier and route destination."
}

output "instance_id" {
  value = aws_route.route.instance_id
}
