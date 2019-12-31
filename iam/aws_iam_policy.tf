# name:        ポリシー名
# path:        一意なパス
# description: ポリシーの説明
# policy:      ポリシーの詳細。今回はfile関数でjsonを指定

# 権限はポリシーで定義する
# ポリシーはポリシードキュメントというjsonで記述する
# ポリシードキュメントを保持するリソースがIAMポリシー(aws_iam_policy)
resource "aws_iam_policy" "deploy" {
  name = "deploy"
  path = "/"
  description = "deploy policy"
  policy = "${file("aws_iam_policies/ecr_policy.json")}"
}

# ECSのインスタンス用のIAMポリシーを作成
resource "aws_iam_policy" "ecs_instance_policy" {
  name = "ecs-instance-policy"
  path = "/"
  description = ""
  policy = "${file("aws_iam_policies/ecs_instance_policy.json")}"
}

resource "aws_iam_policy" "ecs_task_policy" {
  name        = "ecs-task-policy"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/ecs_task_policy.json")
}
