variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}
 
variable "ssh_public_key_file" {
  default = "~/.ssh/id_rsa.pub"
}
 
# Choose an Availability Domain
variable "availability_domain" {
  default = "3"
}
 
variable "internet_gateway_enabled" {
  default = "true"
}
 
variable "instance_shape" {
  default = "VM.Standard2.1"
}
 
# Defines the number of instances to deploy
variable "NumInstances" {
  default = "1"
}
 
variable "BootStrapFile" {
  default = "./cloud-init/vm.cloud-config"
}
 
variable "instance_image_ocid" {
  type = "map"
 
  default = {
    // See https://docs.us-phoenix-1.oraclecloud.com/images/
    // Oracle-provided image "Oracle-Linux-7.5-2018.10.16-0"
    us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaahu7hv6lqbdyncgwehipwsuh3htfuxcoxbl4arcetx6hzixft366a"
 
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaab5l5wv7njknupfxvyynplhsygdz67uhfaz35nsnhsk3ufclqjaea"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa527xpybx2azyhcz2oyk6f4lsvokyujajo73zuxnnhcnp7p24pgva"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaap5kk2lbo5lj3k5ff5tl755a4cszjwd6zii7jlcp6nz3gogh54wtq"
  }
}
