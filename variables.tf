variable "synthetic_monitoring_check_alerts" {
  description = <<EOT
Map of synthetic_monitoring_check_alerts, attributes below
Required:
    - check_id
    - alerts (block):
        - name (optional)
        - period (optional)
        - runbook_url (optional)
        - threshold (optional)
EOT

  type = map(object({
    check_id = number
    alerts = list(object({
      name        = optional(string)
      period      = optional(string)
      runbook_url = optional(string)
      threshold   = optional(number)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.synthetic_monitoring_check_alerts : (
        alltrue([for item in v.alerts : (item.name == null || (contains(["ProbeFailedExecutionsTooHigh", "TLSTargetCertificateCloseToExpiring", "HTTPRequestDurationTooHighAvg", "PingRequestDurationTooHighAvg", "DNSRequestDurationTooHighAvg"], item.name)))])
      )
    ])
    error_message = "must be one of: \"ProbeFailedExecutionsTooHigh\", \"TLSTargetCertificateCloseToExpiring\", \"HTTPRequestDurationTooHighAvg\", \"PingRequestDurationTooHighAvg\", \"DNSRequestDurationTooHighAvg\""
  }
  validation {
    condition = alltrue([
      for k, v in var.synthetic_monitoring_check_alerts : (
        alltrue([for item in v.alerts : (item.period == null || (contains(["", "5m", "10m", "15m", "20m", "30m", "1h"], item.period)))])
      )
    ])
    error_message = "must be one of: \"\", \"5m\", \"10m\", \"15m\", \"20m\", \"30m\", \"1h\""
  }
}

