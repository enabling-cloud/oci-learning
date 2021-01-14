# https://www.terraform.io/docs/configuration/data-sources.html
# https://www.terraform.io/docs/providers/oci/d/identity_availability_domains.html
# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.compartment_ocid}"
}

# https://www.terraform.io/docs/providers/oci/d/core_images.html
data "oci_core_images" "oracle_linux_image" {
  compartment_id           = "${var.compartment_ocid}"
  operating_system         = "Oracle Linux"
  operating_system_version = "7.6"
}
