resource "aws_ecrpublic_repository" "foo" {
  repository_name = "cloud_monitoring"

  tags = {
    env = "1st"
  }
}

output "repository_url" {
    description = "URL Repo ecr"
    value = aws_ecrpublic_repository.foo.repository_uri
}