resource "cloudflare_dns_record" "record_srv_uk_co_ystv_elections_minecraft" {
  name    = "_minecraft._tcp.elections.ystv.co.uk"
  proxied = false
  ttl     = 1
  type    = "SRV"
  zone_id = var.ystv_co_uk_zone_id
  data = {
    port     = 25506
    priority = 0
    target   = "host.moir.xyz"
    weight   = 0
  }
  settings = {}
  comment  = var.dns_record_comment
}
