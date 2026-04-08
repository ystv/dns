# DNS records should be named "record_<record_type>_" followed by the full domain reversed.
# For example, a CNAME record for stream.radio.roses.media becomes record_cname_media_roses_radio_stream

locals {
  ystv_aaaa_records = {
    uk_co_ystv = {
      name    = "ystv.co.uk"
      content = "2001:630:61:1c4::1:78" # ystvwebvip0.york.ac.uk
    }
    uk_co_ystv_cdn = {
      name    = "cdn.ystv.co.uk"
      content = "2001:630:61:17c::1:79" # ystvcdn0.york.ac.uk
    }
    uk_co_ystv_infra_vip = {
      name    = "vip.infra.ystv.co.uk"
      content = "2001:630:61:1c4::1:78" # ystvwebvip0.york.ac.uk
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
