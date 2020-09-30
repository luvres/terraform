variable "pm_api_url" {
#  default = "https://191.96.255.97:8006/api2/json"
  default = "https://169.8.192.66:8006/api2/json"
}

variable "pm_user" {
  default = "root@pam"
}

variable "pm_password" {
  default = "aamu02"
}

variable "pm_tls_insecure" {
  default = "true"
}

variable "pm_host" {
#  default = "191.96.255.97"
  default = "169.8.192.66"
}

variable "subnet" {
#  default = "191.96.255"
  default = "169.8.192"
}

variable "ip_start" {
  default = "1"
}

variable "subnet_mask" {
  default = "26"
}

variable "gateway" {
#  default = "191.96.255.126"
  default = "169.8.192.126"
}

variable "vm_count" {
  default = 1
}

variable "vm_id" {
  default = 1
}


variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCb+D+grg2xiqWf3s6ssPTVB86hj0TwOdEhJYVdDi7aCrD4/DVeRgtmreiXBf/7mAuLhN0bRbYc+pupi7kznb0xtEStj9/ZkOsBVggJq0QXDjhjgfV0nv4aiIfSs0uj9Q7W3SoQO2QX7K6iL3V01Wm/6tzGn0ikE95DPsk166w3Gqs72Jv9erVkJL5LYclyXTIjEwajig+H+tfSV8GT2bYbwWdbYNkaiAsPL8B2d/dKT4E7dxrAuaCSTKdFfR75k0a/x/wl9aPmZVH4YoMO6WuMifLpaceErwL+vI5JhQ2BzHvU07zVC5l+jggzVjt5yGuvpEiaZ05VrotZGW2B5sPB"
}

variable "private_key" {
#  default = "${file("~/.ssh/id_rsa")}"
  default = <<EOF
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn
NhAAAAAwEAAQAAAQEAm/g/oK4NsYqln97OrLD01QfOoY9E8DnRISWFXQ4u2gqw+Pw1XkYL
Zq3olwX/+5gLi4TdG0W2HPqbqYu5M529MbRErY/f2ZDrAVYICatEFw44Y4H1dJ7+GoiH0r
NLo/UO1t0qEDtkF+yuoi91dNVpv+rcxp9IpBPeQz7JNeusNxqrO9ib/Xq1ZCS+S2HJcl0y
IxMGo4oPh/rX0lfBk9m2G8FnW2DZGogLDy/Adnf3Sk+BO3cawLmgkkynRX0e+ZNGv8f8Jf
Wj5mVR+GKDDulrjIny6WnHhK8C/ryOSYUNgcx71NO81QuZfo4IM1Y7echrr6RImmdOVa6L
WRltgebDwQAAA8jlGYze5RmM3gAAAAdzc2gtcnNhAAABAQCb+D+grg2xiqWf3s6ssPTVB8
6hj0TwOdEhJYVdDi7aCrD4/DVeRgtmreiXBf/7mAuLhN0bRbYc+pupi7kznb0xtEStj9/Z
kOsBVggJq0QXDjhjgfV0nv4aiIfSs0uj9Q7W3SoQO2QX7K6iL3V01Wm/6tzGn0ikE95DPs
k166w3Gqs72Jv9erVkJL5LYclyXTIjEwajig+H+tfSV8GT2bYbwWdbYNkaiAsPL8B2d/dK
T4E7dxrAuaCSTKdFfR75k0a/x/wl9aPmZVH4YoMO6WuMifLpaceErwL+vI5JhQ2BzHvU07
zVC5l+jggzVjt5yGuvpEiaZ05VrotZGW2B5sPBAAAAAwEAAQAAAQEAhCUSk6qkQ3Y62XbH
GJ1c8lkJAu0F9ZqmyzSlB7CKlYZVZr8Y4GTsJ/TUiZA10A6ESZMqWn73yxmxZTbSlR7iOw
iG3550hDs6QQmJCdgnenk74WMsecBzfjuLCEOMpL9t8TG0/8eyCGspkpQvKevfCxGMOGSg
ARQsTkEV7S9d29jT09eXSOYlwBNzjjQ885mYxTXQYawC3JLQcn8OLWJ7iGSZTuuhnDt5Vo
csqvAju9QsDLex7GzakMdGgj/A3gHvfxreASyX1H5oEWbzd/ZxIPi6/yEW4q3JibsGuvlw
VJq/HrAMwyE+wmoekn9cwHiJJ6f+rCZTdCGFXk1AYiYKeQAAAIAdbckj96DvQgVEBcIMN2
DQk+GQtZMHBl8tFzCW26XavsryujcKJw3a2ZlO/WWUCYc6q+mD+DvTV4im5Ba8/KSfGsQf
g5Rqd8o8Uj1/Xx8ADxHFbHJn43G04npbLskhtBu6ef9DGPGplfxHLPaYz2JhiaLl6I8N23
qUYKKwoW5lrQAAAIEAziY7Wj0KHTcO6FpaIEx0uQZAZlZGznTESXO99gADhPS510j8C3o1
3GlXSRv+bJDSiOkzmV3NyGYpl717gN/D1glF0jQcWMQD1PqnKKC0iY/IL/be2PqSVgzFo4
rPywqUBdA+9ORkehiI2XM1Po7rucpJ5+sdSJdqdEFCFUM6BcsAAACBAMGvn+EtzWi5bAQX
/5ipbryroim5LFQdEAIO5cW6ujiEE7xaVLgyj0EW8mPQVSmOB8zu0UFkjL6h17E41/iIBi
ssW/KCKZWiW07CJqAQA/Ocdq9fQbx2Oogn7o+KfUFLYSBgcZQAofNCdduHa6vpnIAtB/NS
+Vwap6tIeoYfIMsjAAAADWx1dnJlc0BsYXB0b3ABAgMEBQ==
-----END OPENSSH PRIVATE KEY-----
EOF
}



