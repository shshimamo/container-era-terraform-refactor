# ami: EC2インスタンスを作成するマシンイメージを指定する。ECS用のマシンイメージのIDを指定している
# instance_type: ECSを動かすには最低でもt2.smallは必要
# monitoring: Webコンソールでインスタンスの詳細を表示するかを指定する
# iam_instance_profile: remote_state経由でecs_instance_profile_nameを参照している
# subnet_id: EC2を配置するsubnetのidを指定する。remote_state経由でpublic_subnet_1_idを参照している
# user_data: EC2ローンチする時に実行されるファイルを指定できる。ECS_CLISTERをセットするシェルスクリプトを指定する
# associate_public_ip_address: VPC内でpublicなIPアドレスを関連づけるか指定できる
# vpc_security_group_ids: EC2にセットするSecurityGroupを配列で指定できる

resource "aws_instance" "container-era" {
  ami = "ami-0e37e42dff65024ae"
  instance_type = "t2.small"
  monitoring = true
  iam_instance_profile = data.terraform_remote_state.aws_iam.outputs.ecs_instance_profile_name
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_1_id
  user_data = file("./user_data.sh")
  associate_public_ip_address = true

  vpc_security_group_ids = [
    "${aws_security_group.instance.id}"
  ]

  root_block_device {
    volume_size = "30"
    volume_type = "gp2"
  }
}
