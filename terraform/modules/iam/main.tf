
resource "aws_iam_user" "dev_readonly" {
  name = var.readonly_username
}

resource "aws_iam_user_policy" "dev_readonly_policy" {
  name = "dev-readonly-policy"
  user = aws_iam_user.dev_readonly.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "eks:DescribeCluster",
          "eks:ListClusters",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:GetLogEvents",
          "cloudwatch:GetMetricData"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_access_key" "dev_access_key" {
  user = aws_iam_user.dev_readonly.name
}

output "user_name" {
  value = aws_iam_user.dev_readonly.name
}

output "access_key_id" {
  value = aws_iam_access_key.dev_access_key.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.dev_access_key.secret
  sensitive = true
}
