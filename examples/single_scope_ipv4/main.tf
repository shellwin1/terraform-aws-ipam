#####################################################################################
# Terraform module examples are meant to show an _example_ on how to use a module
# per use-case. The code below should not be copied directly but referenced in order
# to build your own root module that invokes this module
#####################################################################################

module "basic" {
  # source  = "aws-ia/ipam/aws"
  source = "../.."

  top_cidr = ["10.0.0.0/8"]
  top_name = "basic ipam"

  pool_configurations = {
    corporate-us-west-2 = {
      description = "2nd level, locale eu-central-1 pool"
      cidr        = ["10.0.0.0/16", "10.1.0.0/16"]

      sub_pools = {

        dev = {
          netmask_length = 20
          ram_share_principals = var.prod_account
          locale = "eu-central-1"
        }
      }
    }
  }
}
