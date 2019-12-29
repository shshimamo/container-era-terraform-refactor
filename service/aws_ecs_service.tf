# name: ECSサービスの名前
# cluster: 作成したECSクラスタのIDを指定
# task_definition: TaskDefinitionのarnを指定する
# desired_count: TaskDefinitionを実行するインタンスの数
# launch_type: EC2かFargateを指定する。

resource "aws_ecs_service" "container-era-service" {
  name = "container-era-service"
  cluster = aws_ecs_cluster.container-era-ecs-cluster.id
  task_definition = aws_ecs_task_definition.container-era-task.arn
  desired_count = 1
  launch_type = "EC2"

  load_balancer {
    target_group_arn = aws_lb_target_group.http.arn
    container_name = "container-era-webapp"
    container_port = "4567"
  }
}
