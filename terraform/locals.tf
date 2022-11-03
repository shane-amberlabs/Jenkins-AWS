locals {
  location_prefix = substr(var.location, 0, 3)
  base_name       = "${local.location_prefix}-${var.subscription_name}-${var.pdu}"
  bucket          = "uk.gov.dwp.health.${terraform.workspace}.${var.subscription_name}"
}