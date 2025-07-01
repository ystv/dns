# DNS records should be named "record_<record_type>_" followed by the full domain reversed.
# For example, a CNAME record for stream.radio.roses.media becomes record_cname_media_roses_radio_stream

locals {
  ystv_aaaa_records = {
    uk_co_ystv_stargate = {
      name    = "stargate.ystv.co.uk"
      content = "2001:41c9:1:41e::193"
    }
  }
}

resource "cloudflare_dns_record" "records_aaaa_uk_co_ystv" {
  for_each = local.ystv_aaaa_records

  name    = each.value.name
  content = each.value.content

  proxied  = false
  ttl      = 1
  type     = "AAAA"
  zone_id  = var.ystv_co_uk_zone_id
  settings = {}
  comment  = var.dns_record_comment

}
