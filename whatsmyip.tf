# Get the curent public IP to configure the NSG for SSH access to the VMs
data "external" "myipaddr" {
  program = ["bash", "-c", "curl -s 'https://ipinfo.io/json'"]
}

