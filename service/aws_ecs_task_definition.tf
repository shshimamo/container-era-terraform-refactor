# family: TaskDefinitionの名前を指定する。ファミリーはタスク定義名のプレフィックス。ファミリーにリビジョン番号を付与したものがタスク定義名になる。
# container_definitions: TaskDefinitionの定義
# task_role_arn: タスク実行のためのIAMロールのarnを指定する
# network_mode: Dockerコンテナで使用するネットワークモードを指定する。ここではbridgeを指定しDockerの組み込み仮想ネットワークを使用している

resource "aws_ecs_task_definition" "container-era-task" {
  family = "container-era-service"
  container_definitions = file("./container_definitions/service.json")

  execution_role_arn = data.terraform_remote_state.aws_iam.outputs.ecs_task_role_arn
  network_mode = "bridge"
}

resource "aws_ecs_task_definition" "container-era-migration-task" {
  family = "container-era-migration"
  container_definitions = file("./container_definitions/migration.json.tpl")

  execution_role_arn = data.terraform_remote_state.aws_iam.outputs.ecs_task_role_arn
  network_mode = "bridge"
}
