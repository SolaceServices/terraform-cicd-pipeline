variable "msg_vpn_name" {
  type = string
  description = "Name of the message VPN."
}

variable "sdkperf_user_password" {
  sensitive = true
  type = string
  description = "Password for the sdkperf user."
}

