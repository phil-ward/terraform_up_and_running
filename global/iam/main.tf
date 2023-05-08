provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Owner     = "team-foo"
      ManagedBy = "terraform"
    }
  }
}

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
  name     = each.value
}

output "all_users" {
  value = values(aws_iam_user.example)[*].arn
}