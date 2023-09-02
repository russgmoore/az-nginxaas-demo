data "cloudinit_config" "server_config" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = templatefile("cloud-init/cloud-config.tftpl", {
      pkgs = ["nginx", "git"]
    })
  }
/*
  part {
    content_type = "text/x-shellscript"
    content      = file("scripts/setup-script.sh")
  }
*/  
}