# EC2とECSのためのIAMに使用するIAMロール
# name: IAMロールの名前
# path: 一意なパス
# assume_role_policy: assumeポリシーを指定する。今回はfile関数でjsonを指定している

resource "aws_iam_role" "ecs_instance_role" {
  name               = "ecs_instance_role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ec2_assume_role_policy.json")}"
}