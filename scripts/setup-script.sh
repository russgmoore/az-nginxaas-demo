#!/bin/bash
# Setup script that should be running after packages are installed

cat > /var/www/html/script-drop.html<<EOF
<p>This file was dropped by the setup-script.sh script running from cloud-init</p>
EOF

systemctl enable nginx
systemctl start nginx