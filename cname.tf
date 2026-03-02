# DNS records should be named "record_<record_type>_" followed by the full domain reversed.
# For example, a CNAME record for stream.radio.roses.media becomes record_cname_media_roses_radio_stream

locals {
  ystv_cname_records = {
    uk_co_ystv_wildcard = {
      name    = "*.ystv.co.uk"
      content = "ystv.co.uk"
    }
    uk_co_ystv_comp_wildcard = {
      name    = "*.comp.ystv.co.uk"
      content = "ystv.co.uk"
    }
    uk_co_ystv_dev_wildcard = {
      name    = "*.dev.ystv.co.uk"
      content = "ystv.co.uk"
    }
    uk_co_ystv_prod_wildcard = {
      name    = "*.prod.ystv.co.uk"
      content = "ystv.co.uk"
    }
    uk_co_ystv_static = {
      name    = "static.ystv.co.uk"
      content = "ystvcdn0.york.ac.uk"
    }
    uk_co_ystv_static_wildcard = {
      name    = "*.static.ystv.co.uk"
      content = "ystvcdn0.york.ac.uk"
    }
    uk_co_ystv_checkmate = {
      name    = "checkmate.ystv.co.uk"
      content = "stargate.ystv.co.uk"
    }
    uk_co_ystv_filestore = {
      name    = "filestore.ystv.co.uk"
      content = "mckellen.ystv.york.ac.uk"
    }
    uk_co_ystv_irc = {
      name    = "irc.ystv.co.uk"
      content = "stargate.ystv.co.uk"
    }
    uk_co_ystv_offline = {
      name    = "offline.ystv.co.uk"
      content = "ystvmonitoring0.ystv.york.ac.uk"
    }
    uk_co_ystv_roses = {
      name    = "roses.ystv.co.uk"
      content = "ystv.github.io"
    }
    uk_co_ystv_rtmp = {
      name    = "rtmp.ystv.co.uk"
      content = "stream.ystv.co.uk"
    }
    uk_co_ystv_smtp = {
      name    = "smtp.ystv.co.uk"
      content = "stargate.ystv.co.uk"
    }
    uk_co_ystv_talkback = {
      name    = "talkback.ystv.co.uk"
      content = "stargate.ystv.co.uk"
    }
    uk_co_ystv_web-videos = {
      name    = "web-videos.ystv.co.uk"
      content = "cloud9.ystv.york.ac.uk"
    }
    uk_co_ystv_minecraft = {
      name    = "minecraft.ystv.co.uk"
      content = "stargate.ystv.co.uk"
    }

    uk_co_ystv_dev_keycloak-theme = {
      name    = "keycloak-theme.dev.ystv.co.uk"
      content = "ystv.github.io"
    }
  }
}

resource "cloudflare_dns_record" "records_cname_uk_co_ystv" {
  for_each = local.ystv_cname_records

  name    = each.value.name
  content = each.value.content

  proxied  = false
  ttl      = 1
  type     = "CNAME"
  zone_id  = var.ystv_co_uk_zone_id
  settings = {}
  comment  = var.dns_record_comment
}
