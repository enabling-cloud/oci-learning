# https://www.terraform.io/docs/providers/oci/r/containerengine_cluster.html
resource "oci_containerengine_cluster" "k8s_cluster" {
  #Required
  compartment_id     = "${var.compartment_ocid}"
  kubernetes_version = "${var.oke["version"]}"
  name               = "${var.oke["name"]}"
  vcn_id             = "${oci_core_vcn.oke_vcn.id}"

  #Optional
  options {
    service_lb_subnet_ids = ["${oci_core_subnet.LoadBalancerSubnetAD1.id}", "${oci_core_subnet.LoadBalancerSubnetAD2.id}"]
  }
}

# https://www.terraform.io/docs/providers/oci/r/containerengine_node_pool.html
resource "oci_containerengine_node_pool" "k8s_node_pool" {
  #Required
  cluster_id         = "${oci_containerengine_cluster.k8s_cluster.id}"
  compartment_id     = "${var.compartment_ocid}"
  kubernetes_version = "${var.oke["version"]}"
  name               = "${var.oke["name"]}"
  node_image_name    = "${var.worker_ol_image_name}"
  node_shape         = "${var.oke["shape"]}"
  subnet_ids         = ["${oci_core_subnet.workerSubnetAD1.id}", "${oci_core_subnet.workerSubnetAD2.id}", "${oci_core_subnet.workerSubnetAD3.id}"]

  quantity_per_subnet = "${var.oke["nodes_per_subnet"]}"
  ssh_public_key      = "${file(var.ssh_public_key_file)}"
}

# https://www.terraform.io/docs/providers/oci/d/containerengine_cluster_kube_config.html
data "oci_containerengine_cluster_kube_config" "cluster_kube_config" {
  cluster_id    = "${oci_containerengine_cluster.k8s_cluster.id}"
  expiration    = 2592000
  token_version = "1.0.0"
}

# https://www.terraform.io/docs/providers/local/r/file.html
resource "local_file" "kubeconfig" {
  content  = "${data.oci_containerengine_cluster_kube_config.cluster_kube_config.content}"
  filename = "${path.module}/kubeconfig"
}
