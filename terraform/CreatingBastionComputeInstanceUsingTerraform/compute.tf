resource "oci_core_instance" "Bastion" {
  #Required 
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.availability_domain - 1],"name")}"
  compartment_id      = "${var.compartment_ocid}"
  shape               = "${var.instance_shape}"
 
  #Optional
  count        = "${var.NumInstances}"
  display_name = "Bastion${count.index}"
 
  create_vnic_details {
    #Required 
    subnet_id = "${oci_core_subnet.terraform_subnet.id}"
 
    #Optional
    display_name     = "primaryvnic"
    assign_public_ip = true
    hostname_label   = "Bastion${count.index}"
    private_ip       = "10.0.0.2"
  }
 
  source_details {
    source_type = "image"
    source_id   = "${"${var.instance_image_ocid[var.region]}"}"
 
    # Apply this to set the size of the boot volume that's created for this instance.
    # Otherwise, the default boot volume size of the image is used.
    # This should only be specified when source_type is set to "image".
    #boot_volume_size_in_gbs = "60"
  }
 
  # Apply the following flag only if you wish to preserve the attached boot volume upon destroying this instance
  # Setting this and destroying the instance will result in a boot volume that should be managed outside of this config.
  # When changing this value, make sure to run 'terraform apply' so that it takes effect before the resource is destroyed.
  #preserve_boot_volume = true
 
  metadata {
    ssh_authorized_keys = "${file(var.ssh_public_key_file)}"
    user_data           = "${base64encode(file(var.BootStrapFile))}"
  }
  timeouts {
    create = "60m"
  }
}
