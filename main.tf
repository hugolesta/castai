data "castai_credentials" "existing_aws" {
  name = "Free trial AWS credentials"
}

resource "castai_cluster" "hlesta_cluster" {
  name   = "${var.env["project"]}-${var.env["environment"]}-${var.env["region"]}"
  region = var.env["region"]
  credentials = [
    data.castai_credentials.existing_aws.id
  ]

  initialize_params {
    nodes {
      cloud = "aws"
      role  = "master"
      shape = "small"
    }
    nodes {
      cloud = "aws"
      role  = "worker"
      shape = "small"
    }
  }
}

