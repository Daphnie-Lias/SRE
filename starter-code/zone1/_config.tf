terraform {
   backend "s3" {
     bucket = "udacity-tf-daphnie"
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
   }
 }

 provider "aws" {
   region = "us-east-2"
   profile = "udacitylab"
   
   default_tags {
     tags = local.tags
   }
 }

 provider "aws" {
  alias  = "usw1"
   profile = "udacitylab"
   region = "us-west-1"

}