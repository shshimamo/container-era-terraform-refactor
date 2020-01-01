# ドメインの所有権の検証方法にDNS検証を選んだとき検証用のDNSレコードが必要になる
# DNSレコードのリソース作成は次のように書く
# name, type, records を aws_acm_certificate から参照して作成する

resource "aws_route53_record" "shi4to_certificate" {
  zone_id = data.aws_route53_zone.shi4to.id
  name    = aws_acm_certificate.shi4to.domain_validation_options[0].resource_record_name
  type    = aws_acm_certificate.shi4to.domain_validation_options[0].resource_record_type
  records = [
    aws_acm_certificate.shi4to.domain_validation_options[0].resource_record_value
  ]
  ttl = 60
}
