resource "cloudflare_dns_record" "record_srv_uk_co_ystv_elections_minecraft" {
  name    = "_minecraft._tcp.elections.ystv.co.uk"
  proxied = false
  ttl     = 1
  type    = "SRV"
  zone_id = var.ystv_co_uk_zone_id
  data = {
    port     = 25565
    priority = 0
    target   = "temjin.infra.archess.mn"
    weight   = 0
  }
  tags = []
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "record_srv_uk_co_ystv_elections_minecraft_2" {
  name    = "_minecraft._tcp.elect.ystv.co.uk"
  proxied = false
  ttl     = 1
  type    = "SRV"
  zone_id = var.ystv_co_uk_zone_id
  data = {
    port     = 25565
    priority = 0
    target   = "temjin.infra.archess.mn"
    weight   = 0
  }
  tags = []
  settings = {}
  comment  = var.dns_record_comment
}
