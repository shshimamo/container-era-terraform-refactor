# cidr_block: IPアドレスの設定を行う。先頭16ビットまでをネットワーク部とする設定をしている
# instance_tenancy: VPC内で立ち上げるインスタンスを専有するかどうかの設定
#                   defaultは共有されたハードウェアでインスタンスが立ち上がる
# enable_dns_support: VPCに対してDNS解決がサポートされるか設定する
#                     trueを設定しDNS解決を有効にしている
# enable_dns_hostnames: VPC内で起動するインスタンスがpublicなDNSホスト名を取得するかどうか
#                       trueを設定しEC2インスタンスにDNSのホスト名が割り当てられるようにしている
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
}