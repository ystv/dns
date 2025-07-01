# DNS records should be named "record_<record_type>_" followed by the full domain reversed.
# For example, a CNAME record for stream.radio.roses.media becomes record_cname_media_roses_radio_stream

locals {
  ystv_mx_records = {
    uk_co_ystv_primary = {
      name     = "ystv.co.uk"
      content  = "aspmx.l.google.com"
      priority = 1
    }
    uk_co_ystv_alt1 = {
      name     = "ystv.co.uk"
      content  = "alt1.aspmx.l.google.com"
      priority = 5
    }
    uk_co_ystv_alt2 = {
      name     = "ystv.co.uk"
      content  = "alt2.aspmx.l.google.com"
      priority = 5
    }
    uk_co_ystv_alt3 = {
      name     = "ystv.co.uk"
      content  = "alt3.aspmx.l.google.com"
      priority = 10
    }
    uk_co_ystv_alt4 = {
      name     = "ystv.co.uk"
      content  = "alt4.aspmx.l.google.com"
      priority = 10
    }
  }
}

resource "cloudflare_dns_record" "records_mx_uk_co_ystv" {
  for_each = local.ystv_mx_records

  name     = each.value.name
  content  = each.value.content
  priority = each.value.priority

  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = var.ystv_co_uk_zone_id
  settings = {}
  comment  = var.dns_record_comment

}
