resource "solacebroker_msg_vpn" "sandbox-vpn" {
  authentication_basic_type                               = "internal"
  authentication_client_cert_max_chain_depth              = 8
  authentication_client_cert_validate_date_enabled        = false
  dmr_enabled                                             = true
  enabled                                                 = true
  event_connection_count_threshold                        = {"clear_percent":60,"set_percent":80}
  event_egress_flow_count_threshold                       = {"clear_percent":60,"set_percent":80}
  event_egress_msg_rate_threshold                         = {"clear_value":3000000,"set_value":4000000}
  event_endpoint_count_threshold                          = {"clear_percent":60,"set_percent":80}
  event_ingress_flow_count_threshold                      = {"clear_percent":60,"set_percent":80}
  event_ingress_msg_rate_threshold                        = {"clear_value":3000000,"set_value":4000000}
  event_large_msg_threshold                               = 11
  event_log_tag                                           = "tag"
  event_msg_spool_usage_threshold                         = {"clear_percent":60,"set_percent":80}
  event_service_amqp_connection_count_threshold           = {"clear_percent":60,"set_percent":80}
  event_service_mqtt_connection_count_threshold           = {"clear_percent":60,"set_percent":80}
  event_service_rest_incoming_connection_count_threshold  = {"clear_percent":60,"set_percent":80}
  event_service_smf_connection_count_threshold            = {"clear_percent":60,"set_percent":80}
  event_service_web_connection_count_threshold            = {"clear_percent":60,"set_percent":80}
  event_subscription_count_threshold                      = {"clear_percent":60,"set_percent":80}
  event_transacted_session_count_threshold                = {"clear_percent":60,"set_percent":80}
  event_transaction_count_threshold                       = {"clear_percent":60,"set_percent":80}
  
  jndi_enabled                                            = false
  
  max_connection_count                                    = 250
  max_egress_flow_count                                   = 250
  max_endpoint_count                                      = 250
  max_ingress_flow_count                                  = 250
  max_kafka_broker_connection_count                       = 300
  max_msg_spool_usage                                     = 50000
  max_subscription_count                                  = 50000
  max_transacted_session_count                            = 500
  max_transaction_count                                   = 2500
  msg_vpn_name                                            = "sandbox"
  rest_tls_server_cert_max_chain_depth                    = 8
  
  service_amqp_max_connection_count                       = 250
  service_amqp_plain_text_listen_port                     = 5672
  service_amqp_tls_enabled                                = true
  service_amqp_tls_listen_port                            = 5671

  service_mqtt_max_connection_count                       = 1000
  service_mqtt_plain_text_listen_port                     = 1883
  service_mqtt_tls_enabled                                = true
  service_mqtt_tls_listen_port                            = 8883
  service_mqtt_tls_web_socket_enabled                     = true
  service_mqtt_tls_web_socket_listen_port                 = 8443
  service_mqtt_web_socket_listen_port                     = 8000
  
  service_rest_incoming_max_connection_count              = 1000
  service_rest_incoming_plain_text_listen_port            = 9000
  service_rest_incoming_tls_enabled                       = true
  service_rest_incoming_tls_listen_port                   = 9443
  service_rest_outgoing_max_connection_count              = 1000
  
  service_smf_max_connection_count                        = 250
  service_smf_plain_text_enabled                          = false
  service_web_max_connection_count                        = 1000
  service_web_plain_text_enabled                          = false

}

