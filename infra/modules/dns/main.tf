resource "aws_route53_record" "app" {
  zone_id = var.zone_id
  name    = "app.${var.domain}"
  type    = "CNAME"
  ttl     = 300
  records = [var.lb_dns_name]
}
