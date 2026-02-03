#
resource "solacebroker_msg_vpn_acl_profile" "sandbox-vpn_sdkperf_dmq_acl" {
  depends_on = [ solacebroker_msg_vpn.sandbox-vpn ]
  acl_profile_name                = "sdkperf_dmq_acl"
  client_connect_default_action   = "allow"
  msg_vpn_name                    = solacebroker_msg_vpn.sandbox-vpn.msg_vpn_name
  publish_topic_default_action    = "allow"
  subscribe_topic_default_action  = "allow"
}

resource "solacebroker_msg_vpn_client_profile" "sandbox-vpn_sdkperf_dmq_cp" {
  depends_on = [ solacebroker_msg_vpn.sandbox-vpn ]
  allow_guaranteed_msg_receive_enabled                              = true
  allow_guaranteed_msg_send_enabled                                 = true
  client_profile_name                                               = "sdkperf_cp"
  event_client_provisioned_endpoint_spool_usage_threshold           = {"clear_percent":18,"set_percent":25}
  event_connection_count_per_client_username_threshold              = {"clear_percent":60,"set_percent":80}
  event_egress_flow_count_threshold                                 = {"clear_percent":60,"set_percent":80}
  event_endpoint_count_per_client_username_threshold                = {"clear_percent":60,"set_percent":80}
  event_ingress_flow_count_threshold                                = {"clear_percent":60,"set_percent":80}
  event_service_smf_connection_count_per_client_username_threshold  = {"clear_percent":60,"set_percent":80}
  event_service_web_connection_count_per_client_username_threshold  = {"clear_percent":60,"set_percent":80}
  event_subscription_count_threshold                                = {"clear_percent":60,"set_percent":80}
  event_transacted_session_count_threshold                          = {"clear_percent":60,"set_percent":80}
  event_transaction_count_threshold                                 = {"clear_percent":60,"set_percent":80}
  max_connection_count_per_client_username                          = 1000
  max_subscription_count                                            = 500000
  max_transaction_count                                             = 5000
  msg_vpn_name                                                      = solacebroker_msg_vpn.sandbox-vpn.msg_vpn_name
  service_smf_max_connection_count_per_client_username              = 1000
  service_web_max_connection_count_per_client_username              = 1000
}

resource "solacebroker_msg_vpn_client_username" "sandbox-vpn_sdkperf_dmq" {
  acl_profile_name     = solacebroker_msg_vpn_acl_profile.sandbox-vpn_sdkperf_dmq_acl.acl_profile_name
  client_profile_name  = solacebroker_msg_vpn_client_profile.sandbox-vpn_sdkperf_dmq_cp.client_profile_name
  client_username      = "sdkperf_dmq"
  password             = var.testing_dmq_user_password
  enabled              = true
  msg_vpn_name         = solacebroker_msg_vpn.sandbox-vpn.msg_vpn_name
  guaranteed_endpoint_permission_override_enabled = true
}