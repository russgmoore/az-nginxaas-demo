data "cloudinit_config" "twofiles" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    filename = "userdata_lin1"
    content  = <<-EOF
      #!/bin/bash
      echo "script 1"
    EOF
  }

  part {
    content_type = "text/x-shellscript"
    filename = "userdata_lin2"
    content  = <<-EOF
      #!/bin/bash
      echo "hello"
    EOF
  }
}
