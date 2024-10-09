output "loadbalancer-dns" {
  value = "Access load balancer with: ${module.alb.alb-dns}"
}