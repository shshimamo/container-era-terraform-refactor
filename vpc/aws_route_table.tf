# インターネットゲートウェイとサブネットの経路を設定する外部通信用のルートテーブルの作成
# vpc_id: ルートテーブルを紐付けるVPCのidを指定する。
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
}