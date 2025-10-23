output "readonly_user_access_key" {
  value = aws_iam_access_key.dev_access_key.id
  sensitive = true
}

output "readonly_user_secret" {
  value = aws_iam_access_key.dev_access_key.secret
  sensitive = true
}
