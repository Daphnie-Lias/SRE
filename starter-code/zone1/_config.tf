terraform {
   backend "s3" {
     bucket = "udacity-tf-daphnie"
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
   }
 }

 provider "aws" {
   region = "us-east-2"
   profile = "udacity_admin"
   
   default_tags {
     tags = local.tags
   }
 }

 provider "aws" {
  alias  = "usw1"
   profile = "udacity_admin"
   region = "us-west-1"

}