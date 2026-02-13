terraform {
  backend "local" {
    path = "tfstate/terraform.tfstate"
  }
  required_providers {
    solacecloud = {
      source = "registry.terraform.io/solaceproducts/solacecloud"
      version = "0.2.1"
    }
    solacebroker = {
      source  = "SolaceProducts/solacebroker"
      version = "1.1.0"
    }
  }
}


provider "solacecloud" {
  base_url  = "https://api.solace.cloud/"
  api_token = var.solace_api_token
  api_polling_interval = 10
}

provider "solacebroker" {
  url            = var.broker_url
  username       = var.broker_username
  password       = var.broker_password
}

# to import existing service, use the following command:
# terraform import solacecloud_service.broker_service <service_id>
#
# comment this block after importing the service to avoid accidental deletion of the service in future terraform apply runs
#
#resource "solacecloud_service" "broker_service" {
#  # (resource arguments)
#}
resource "solacecloud_service" "broker_service" {
    name                 = "AJCR_sandbox_mesh"
    datacenter_id        = "aks-centralus"
    service_class_id     = "ENTERPRISE_250_HIGHAVAILABILITY"
    event_broker_version = "10.25.0.123-19"
    message_vpn_name     = "sandbox"
    max_spool_usage      = 50
    cluster_name         = "cluster-aks-centralus-z9ct14s3ihb"
    locked               = true
    mate_link_encryption = true
    environment_id       = "jz2r4v8v5rg"

    /*
    dmr_cluster          = {
        name                           = "cluster-aks-centralus-z9ct14s3ihb"
        password                       = "ntc2sbaeu2i0b7mn979btq62hu"
        primary_router_name            = "knidkjq340nprimary"
        remote_address                 = "mr-connection-3rsb2f7jjl5.messaging.solace.cloud"
        supported_authentication_modes = [
            "Basic",
        ]
    }
    */
    /*
    id                   = "knidkjq340n"
    owned_by             = "9uz252oc2mi"
    */
    /*
    message_vpn          = {
        authentication_basic_enabled                     = true
        authentication_basic_type                        = "INTERNAL"
        authentication_client_cert_enabled               = false
        authentication_client_cert_validate_date_enabled = false
        editor_management_credential                     = {
            password = "7vr71fplc847gp9h69rl2p5285"
            username = "sandbox-admin"
        }
        manager_management_credential                    = {
            password = "29e0pmjen3i84kq919572vefip"
            username = "mission-control-manager"
        }
        max_connection_count                             = 250
        max_egress_flow_count                            = 250
        max_endpoint_count                               = 250
        max_ingress_flow_count                           = 250
        max_msg_spool_usage                              = 50000
        max_subscription_count                           = 50000
        max_transacted_session_count                     = 500
        max_transaction_count                            = 2500
        messaging_client_credential                      = {
            password = "nge3hf0fii5bi1b846l12o17ru"
            username = "solace-cloud-client"
        }
        name                                             = "sandbox"
        truststore_uri                                   = "https://cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem"
        viewer_management_credential                     = {
            password = "lujdmgc90tfqcrac7qkais11nd"
            username = "sandbox-view"
        }
    }
    */
}

module "message-vpn" {
  source = "./message-vpn"
  msg_vpn_name = "sandbox"
}

module "sdkperf" {
  source = "./sdkperf"
  msg_vpn_name = module.message-vpn.message_vpn_name
  sdkperf_user_password = var.sdkperf_user_password
}

module "sdkperf_dmq" {
  source = "./sdkperf_dmq"
  msg_vpn_name = module.message-vpn.message_vpn_name
  sdkperf_dmq_user_password = var.sdkperf_dmq_user_password
}