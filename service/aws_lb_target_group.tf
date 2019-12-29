# name: ターゲットグループの名前
# port: ターゲットグループがアクセスする先のポート。ここでは4567ポートでアプリが待ち受けるため4567を指定している
# protocol: ターゲットグループがアクセスするプロトコル
# vpc_id: ターゲットグループを作成するVPCのIDを指定
# health_check: ヘルスチェックの設定

resource "aws_lb_target_group" "http" {
  name = "sample-http"
  port = 4567
  protocol = "HTTP"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  health_check {
    interval = 30
    path = "/health_check"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 10
    healthy_threshold = 3
    unhealthy_threshold = 3
  }
}