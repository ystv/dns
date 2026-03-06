# DNS records should be named "record_<record_type>_" followed by the full domain reversed.
# For example, a CNAME record for stream.radio.roses.media becomes record_cname_media_roses_radio_stream

locals {
  ystv_a_records = {
    uk_co_ystv = {
      name    = "ystv.co.uk"
      content = "144.32.100.49"
    }
    uk_co_ystv_cdn = {
      name    = "cdn.ystv.co.uk"
      content = "144.32.124.121" # ystvcdn0.york.ac.uk
    }
    uk_co_ystv_infra_vip = {
      name    = "vip.infra.ystv.co.uk"
      content = "144.32.196.120" # ystvwebvip0.york.ac.uk
    }
    uk_co_ystv_dist_1 = {
      name    = "dist.ystv.co.uk"
      content = "144.32.123.251"
    }
    uk_co_ystv_dist_2 = {
      name    = "dist.ystv.co.uk"
      content = "144.32.123.249"
    }
    uk_co_ystv_local_wildcard = {
      name    = "*.local.ystv.co.uk"
      content = "127.0.0.1"
    }
    uk_co_ystv_stream-backup = {
      name    = "stream-backup.ystv.co.uk"
      content = "144.32.196.19"
    }
    uk_co_ystv_stream = {
      name    = "stream.ystv.co.uk"
      content = "144.32.196.30"
    }
  }
}

resource "cloudflare_dns_record" "records_a_uk_co_ystv" {
  for_each = local.ystv_a_records

  name    = each.value.name
  content = each.value.content

  proxied  = false
  ttl      = 1
  type     = "A"
  zone_id  = var.ystv_co_uk_zone_id
  settings = {}
  comment  = var.dns_record_comment

}
