variable "sdkperf_user_password" {
  sensitive = true
  ephemeral = true
  type = string
  description = "Password for the sdkperf user."
}
