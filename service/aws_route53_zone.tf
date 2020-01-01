data "aws_route53_zone" "shi4to" {
  name = "shi4to.tk"
}

resource "aws_route53_record" "shi4to" {
  zone_id = data.aws_route53_zone.shi4to.zone_id
  name    = data.aws_route53_zone.shi4to.name
  type    = "A"

  alias {
    name    = aws_lb.lb.dns_name
    zone_id = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}
