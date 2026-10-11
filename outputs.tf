output "synthetic_monitoring_check_alerts_id" {
  description = "Map of id values across all synthetic_monitoring_check_alerts, keyed the same as var.synthetic_monitoring_check_alerts except keys with no id are omitted"
  value       = { for k, v in grafana_synthetic_monitoring_check_alerts.synthetic_monitoring_check_alerts : k => v.id if v.id != null && length(v.id) > 0 }
}
output "synthetic_monitoring_check_alerts_alerts" {
  description = "Map of alerts values across all synthetic_monitoring_check_alerts, keyed the same as var.synthetic_monitoring_check_alerts except keys with no alerts are omitted"
  value       = { for k, v in grafana_synthetic_monitoring_check_alerts.synthetic_monitoring_check_alerts : k => v.alerts if v.alerts != null && length(v.alerts) > 0 }
}
output "synthetic_monitoring_check_alerts_check_id" {
  description = "Map of check_id values across all synthetic_monitoring_check_alerts, keyed the same as var.synthetic_monitoring_check_alerts except keys with no check_id are omitted"
  value       = { for k, v in grafana_synthetic_monitoring_check_alerts.synthetic_monitoring_check_alerts : k => v.check_id if v.check_id != null }
}

