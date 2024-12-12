
output "prometheus_url" {
  value       = module.prometheus.prometheus_url
  description = "prometheus metrics endpoint"
}

output "grafana_url" {
  value       = module.grafana.grafana_url
  description = "grafana dashboard endpoint"
}