# user:
#   ポリシーをアタッチする対象のユーザーの名前を指定
#   同じディレクトリ内のaws_iam_user.tfを参照している
# policy_arn:
#   ポリシーのarn(Amazon Resource Name)を指定
#   同じディレクトリ内にaws_iam_policyのリソースが書かれているためarnを指定できる
resource "aws_iam_user_policy_attachment" "deploy-attach" {
  user = "${aws_iam_user.deploy-user.name}"
  policy_arn = "${aws_iam_policy.deploy.arn}"
}