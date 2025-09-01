resource "aws_ecr_repository" "app" {
  name = "${var.env}-product-app"
}

output "registry_url" {
  value = aws_ecr_repository.app.repository_url
}
