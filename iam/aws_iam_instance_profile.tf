# name: IAMインスタンスプロファイルの名前
# role: IAMインスタンスプロファイルに割り当てるロール
resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecs-instance-profile"
  role = aws_iam_role.ecs_instance_role.name
}