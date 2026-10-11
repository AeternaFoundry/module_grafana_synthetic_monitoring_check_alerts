resource "grafana_synthetic_monitoring_check_alerts" "synthetic_monitoring_check_alerts" {
  for_each = var.synthetic_monitoring_check_alerts

  check_id = each.value.check_id

  dynamic "alerts" {
    for_each = each.value.alerts
    content {
      name        = alerts.value.name
      period      = alerts.value.period
      runbook_url = alerts.value.runbook_url
      threshold   = alerts.value.threshold
    }
  }
}

