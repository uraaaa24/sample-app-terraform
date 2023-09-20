output "iam_allow_describe_regions" {
  value = data.aws_iam_policy_document.allow_describe_regions
}

output "iam_role_arn" {
  value = aws_iam_role.default.arn
}

output "iam_role_name" {
  value = aws_iam_role.default.name
}
