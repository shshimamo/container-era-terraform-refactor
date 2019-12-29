# name: ロードバランサの名前
# load_balancer_type: ロードバランサのタイプ
# security_groups: ここではALBのセキュリティグループを作成している
# subnets: ALBに紐付けるsubnet

resource "aws_lb" "lb" {
  name = "container-era-lb"
  internal = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

   subnets = [
     data.terraform_remote_state.vpc.outputs.public_subnet_1_id,
     data.terraform_remote_state.vpc.outputs.public_subnet_2_id,
   ]
}
