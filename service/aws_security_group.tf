# name: SecurityGroupの名前
# description: SecurityGroupの説明
# vpc_id: SecurityGroupリソースを作成するVPCを指定
# egress: SecurityGroupから外に出る通信のポートの範囲と対象IP

resource "aws_security_group" "instance" {
  name = "instance"
  description = "instance sg"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
