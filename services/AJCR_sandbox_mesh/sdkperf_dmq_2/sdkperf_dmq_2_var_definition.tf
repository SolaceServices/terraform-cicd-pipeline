variable "sdkperf_dmq_2_user_password" {
  sensitive = true
  ephemeral = true
  type = string
  description = "Password for the sdkperf DMQ 2 user."
}
