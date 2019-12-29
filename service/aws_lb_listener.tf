# load_balancer_arn: リスナを登録するロードバランサのarn
# port: ロードバランサにアクセスするためのポート
# protocol: ロードバランサにアクセスするためのプロトコル
# default_action: デフォルトで振り向けられるターゲットグループ

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.lb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.http.arn
    type = "forward"
  }
}
