# vpc_id: インターネットに接続するVPCのidを指定する
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
}