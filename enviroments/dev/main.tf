# moduleに書きたいが、現状エラーが出ているため一旦main.tfに記載
data "aws_iam_policy_document" "allow_describe_regions" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:DescribeRegions"] # リージョン一覧を取得する
    resources = ["*"]
  }
}

module "describe_regions_for_ec2" {
  source      = "../../modules/iam_role"
  name        = "describe-regions-for-ec2"
  identifiers = "ec2.amazonaws.com"
  policy      = data.aws_iam_policy_document.allow_describe_regions.json
}
