variable "sdkperf_dmq_user_password" {
  sensitive = true
  ephemeral = true
  type = string
  description = "Password for the sdkperf DMQ user."
}
