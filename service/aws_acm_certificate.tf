# domain_name: ドメイン名を指定する
# subject_alternative_name: hoge.shi4to.tkのようなドメイン名を追加したいときに配列で指定する
# validation_method: ドメインの所有権の検証方法。Eメール検証orDNS検証を選ぶことができる。SSLの自動更新のためにはDNS検証が必要なのでDNS検証を指定している

resource "aws_acm_certificate" "shi4to" {
  domain_name = data.aws_route53_zone.shi4to.name
  subject_alternative_names = []
  validation_method = "DNS"
}
