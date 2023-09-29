# https://www.terraform.io/docs/commands/output.html
# https://learn.hashicorp.com/terraform/getting-started/outputs.html
# Output the result
output "show-ads" {
  value = "${data.oci_identity_availability_domains.ADs.availability_domains}"
}
