# name:        ポリシー名
# path:        一意なパス
# description: ポリシーの説明
# policy:      ポリシーの詳細。今回はfile関数でjsonを指定
resource "aws_iam_policy" "deploy" {
  name = "deploy"
  path = "/"
  description = "deploy policy"
  policy = "${file("aws_iam_policies/ecr_policy.json")}"
}