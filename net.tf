# DNS records should be named "record_<record_type>_" followed by the full domain reversed.
# For example, a CNAME record for stream.radio.roses.media becomes record_cname_media_roses_radio_stream

locals {
  hosts = {
    # bluefighter = {
    #   ipv4 = "144.32.186.152"
    # }
    # cloud9 = {
    #   ipv4 = "144.32.186.146"
    # }
    # comp = {
    #   ipv4 = "144.32.186.147"
    # }
    # dick = {
    #   ipv4 = "144.32.186.149"
    # }
    # dom = {
    #   ipv4 = "144.32.186.150"
    # }
    # hill = {
    #   ipv4 = "144.32.186.134"
    # }
    # mckellen = {
    #   ipv4 = "144.32.186.132"
    # }
    # moss = {
    #   ipv4 = "144.32.186.133"
    # }
    # power = {
    #   ipv4 = "144.32.186.139"
    # }
    # redfighter = {
    #   ipv4 = "144.32.186.151"
    # }
    # speed = {
    #   ipv4 = "144.32.186.138"
    # }
    # web = {
    #   ipv4 = "144.32.186.131"
    # }
    # ystvcache01 = {
    #   ipv4 = "144.32.123.249"
    #   ipv6 = "2001:630:61:17b::1:f9"
    # }
    # ystvcache02 = {
    #   ipv4 = "144.32.123.251"
    #   ipv6 = "2001:630:61:17b::1:fb"
    # }
    # ystvcdn0 = {
    #   ipv4 = "144.32.124.121"
    #   ipv6 = "2001:630:61:17c::1:79"
    # }
    # ystvdb0 = {
    #   ipv4 = "144.32.124.169"
    #   ipv6 = "2001:630:61:17c::1:a9"
    # }
    # ystvdb1 = {
    #   ipv4 = "144.32.124.18"
    #   ipv6 = "2001:630:61:17c::1:12"
    # }
    # ystvdb2 = {
    #   ipv4 = "144.32.124.10"
    #   ipv6 = "2001:630:61:17c::1:a"
    # }
    # ystvmonitoring0 = {
    #   ipv4 = "144.32.196.41"
    #   ipv6 = "2001:630:61:1c4::1:29"
    # }
    ystvstrm0 = {
      ipv4 = "144.32.196.30"
    }
    ystvstrm1 = {
      ipv4 = "144.32.196.19"
      ipv6 = "2001:630:61:1c4::1:13"
    }
    # ystvvault0 = {
    #   ipv4 = "144.32.124.105"
    #   ipv6 = "2001:630:61:17c::1:69"
    # }
    # ystvweb0 = {
    #   ipv4 = "144.32.196.68"
    #   ipv6 = "2001:630:61:1c4::1:44"
    # }
    # ystvweb1 = {
    #   ipv4 = "144.32.196.69"
    #   ipv6 = "2001:630:61:1c4::1:45"
    # }
  }
}

resource "cloudflare_dns_record" "hosts_a_uk_co_ystv_net" {
  for_each = { for host, ips in local.hosts : host => ips if contains(keys(ips), "ipv4") }

  name    = "${each.value.name}.net.ystv.co.uk."
  content = lookup(each.value.content, "ipv4", "N/A")

  proxied  = false
  ttl      = 1
  type     = "A"
  zone_id  = var.ystv_co_uk_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "hosts_aaaa_uk_co_ystv_net" {
  for_each = { for host, ips in local.hosts : host => ips if contains(keys(ips), "ipv6") }

  name    = "${each.value.name}.net.ystv.co.uk."
  content = lookup(each.value.content, "ipv6", "N/A")

  proxied  = false
  ttl      = 1
  type     = "AAAA"
  zone_id  = var.ystv_co_uk_zone_id
  settings = {}
  comment  = var.dns_record_comment
}