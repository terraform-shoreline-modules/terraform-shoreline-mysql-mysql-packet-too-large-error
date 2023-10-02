terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "mysql_packet_too_large_error" {
  source    = "./modules/mysql_packet_too_large_error"

  providers = {
    shoreline = shoreline
  }
}