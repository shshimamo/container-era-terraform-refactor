# family: TaskDefinitionの名前を指定する
# container_definitions: TaskDefinitionの定義
# task_role_arn: タスク実行のためのIAMロールのarnを指定する
# network_mode: Dockerコンテナで使用するネットワークモードを指定する。ここではbridgeを指定しDockerの組み込み仮想ネットワークを使用している

resource "aws_ecs_task_definition" "container-era-task" {
  family = "container-era-service"
  container_definitions = "${file("./container_definitions/service.json")}"

  task_role_arn = data.terraform_remote_state.aws_iam.outputs.ecs_task_role_arn
  network_mode = "bridge"
}
