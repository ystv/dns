# DNS records should be named "record_<record_type>_" followed by the full domain reversed.
# For example, a CNAME record for stream.radio.roses.media becomes record_cname_media_roses_radio_stream

locals {
  caa_tags     = ["issue", "issuewild"]
  caa_values   = ["comodoca.com", "digicert.com", "letsencrypt.org", "pki.goog"]

  ystv_caa_records = {
    for r in flatten([
      for tag in local.caa_tags : [
        for value in local.caa_values : {
          data = {
            flags = 0
            tag   = tag
            value = value
          }
        }
      ]
    ]) : "uk_co_ystv-${r.data.tag}-${r.data.value}" => r
  }
}


resource "cloudflare_dns_record" "records_caa_uk_co_ystv" {
  for_each = local.ystv_caa_records

  name     = "ystv.co.uk"
  data     = each.value.data

  proxied  = false
  ttl      = 1
  type     = "CAA"
  zone_id  = var.ystv_co_uk_zone_id
  settings = {}
  comment  = var.dns_record_comment
  
}