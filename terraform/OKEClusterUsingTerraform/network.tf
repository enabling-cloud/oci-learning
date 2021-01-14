# https://www.terraform.io/docs/configuration/resources.html
# https://www.terraform.io/docs/providers/oci/r/core_vcn.html
resource "oci_core_vcn" "oke_vcn" {
  #Required
  cidr_block     = "${lookup(var.network_cidrs, "vcnCIDR")}"
  compartment_id = "${var.compartment_ocid}"

  #Optional
  dns_label    = "vcn1"
  display_name = "oke-vcn"
}

# https://www.terraform.io/docs/providers/oci/r/core_security_list.html
resource "oci_core_security_list" "oke_sl" {
  #Required
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.oke_vcn.id}"

  egress_security_rules = [
    {
      destination = "0.0.0.0/0"
      protocol    = "all"
    },
  ]

  ingress_security_rules = [
    {
      protocol = "all"
      source   = "0.0.0.0/0"
    },
  ]

  #Optional
  display_name = "oke-sl"
}

# https://www.terraform.io/docs/providers/oci/r/core_internet_gateway.html
resource "oci_core_internet_gateway" "oke_ig" {
  #Required
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.oke_vcn.id}"

  #Optional
  enabled      = "${var.internet_gateway_enabled}"
  display_name = "oke-gateway"
}

# https://www.terraform.io/docs/providers/oci/r/core_route_table.html
resource "oci_core_route_table" "oke_rt" {
  #Required
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.oke_vcn.id}"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.oke_ig.id}"
  }

  #Optional
  display_name = "oke-rt"
}

# https://www.terraform.io/docs/providers/oci/r/core_subnet.html
resource "oci_core_subnet" "workerSubnetAD1" {
  #Required
  cidr_block        = "${lookup(var.network_cidrs, "workerSubnetAD1")}"
  compartment_id    = "${var.compartment_ocid}"
  security_list_ids = ["${oci_core_security_list.oke_sl.id}"]
  vcn_id            = "${oci_core_vcn.oke_vcn.id}"

  #Optional
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")}"
  dhcp_options_id     = "${oci_core_vcn.oke_vcn.default_dhcp_options_id}"
  display_name        = "workerSubnetAD1"
  dns_label           = "worker1"
  route_table_id      = "${oci_core_route_table.oke_rt.id}"
}

resource "oci_core_subnet" "workerSubnetAD2" {
  #Required
  cidr_block        = "${lookup(var.network_cidrs, "workerSubnetAD2")}"
  compartment_id    = "${var.compartment_ocid}"
  security_list_ids = ["${oci_core_security_list.oke_sl.id}"]
  vcn_id            = "${oci_core_vcn.oke_vcn.id}"

  #Optional
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1], "name")}"
  dhcp_options_id     = "${oci_core_vcn.oke_vcn.default_dhcp_options_id}"
  display_name        = "workerSubnetAD2"
  dns_label           = "worker2"
  route_table_id      = "${oci_core_route_table.oke_rt.id}"
}

resource "oci_core_subnet" "workerSubnetAD3" {
  #Required
  cidr_block        = "${lookup(var.network_cidrs, "workerSubnetAD3")}"
  compartment_id    = "${var.compartment_ocid}"
  security_list_ids = ["${oci_core_security_list.oke_sl.id}"]
  vcn_id            = "${oci_core_vcn.oke_vcn.id}"

  #Optional
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[2], "name")}"
  dhcp_options_id     = "${oci_core_vcn.oke_vcn.default_dhcp_options_id}"
  display_name        = "workerSubnetAD3"
  dns_label           = "worker3"
  route_table_id      = "${oci_core_route_table.oke_rt.id}"
}

resource "oci_core_subnet" "LoadBalancerSubnetAD1" {
  #Required
  cidr_block        = "${lookup(var.network_cidrs, "LoadBalancerSubnetAD1")}"
  compartment_id    = "${var.compartment_ocid}"
  security_list_ids = ["${oci_core_security_list.oke_sl.id}"]
  vcn_id            = "${oci_core_vcn.oke_vcn.id}"

  #Optional
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")}"
  dhcp_options_id     = "${oci_core_vcn.oke_vcn.default_dhcp_options_id}"
  display_name        = "LoadBalancerSubnetAD1"
  dns_label           = "loadbalancer1"
  route_table_id      = "${oci_core_route_table.oke_rt.id}"
}

resource "oci_core_subnet" "LoadBalancerSubnetAD2" {
  #Required
  cidr_block        = "${lookup(var.network_cidrs, "LoadBalancerSubnetAD2")}"
  compartment_id    = "${var.compartment_ocid}"
  security_list_ids = ["${oci_core_security_list.oke_sl.id}"]
  vcn_id            = "${oci_core_vcn.oke_vcn.id}"

  #Optional
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1], "name")}"
  dhcp_options_id     = "${oci_core_vcn.oke_vcn.default_dhcp_options_id}"
  display_name        = "LoadBalancerSubnetAD1"
  dns_label           = "loadbalancer2"
  route_table_id      = "${oci_core_route_table.oke_rt.id}"
}
