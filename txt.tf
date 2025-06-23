# DNS records should be named "record_<record_type>_" followed by the full domain reversed.
# For example, a CNAME record for stream.radio.roses.media becomes record_cname_media_roses_radio_stream

locals {
  ystv_txt_records = {
    # Requsted from IT Services on 08/06/23 to verify our domain for the NCSC mail check service
    uk_co_ystv_asvdns_1 = {
      name     = "_asvdns-63f0b4c8-8a61-429e-b54b-aba51e633116.ystv.co.uk"
      content  = "\"asvdns_e3e20b43-ca5e-4af6-9a67-0c478e92b181\""
    }

    # MyNCSC domain verification
    uk_co_ystv_asvdns_2 = {
      name     = "_asvdns-9bf2d41b-624e-4f83-8224-2e562e1b8a31.ystv.co.uk"
      content  = "\"asvdns_8cc3adeb-1ddd-43bf-9b24-0ec733a27b0f\""
    }

    # NCSC verification (maybe York SU)
    uk_co_ystv_asvdns_3 = {
      name     = "_asvdns-9f757c83-1ec3-41a1-ae95-2b9a5e5e7fdf.ystv.co.uk"
      content  = "\"asvdns_db756d4e-f1ec-4aeb-9685-804ad987d308\""
    }

    # PorkBun verification
    uk_co_ystv_bun-verify = {
      name     = "bun-verify.ystv.co.uk"
      content  = "\"6c660e3175c8ed5e47290cb6de540b98af278336db09ceff8ce28ba2a9a6e9c2\""
    }

    # YSTV DMARC policy
    uk_co_ystv_dmarc = {
      name     = "_dmarc.ystv.co.uk"
      content  = "\"v=DMARC1; p=reject; sp=reject; pct=100; adkim=s; aspf=r; rua=mailto:dmarc@ystv.co.uk,mailto:dmarc-rua@dmarc.service.gov.uk;ruf=mailto:dmarc@ystv.co.uk;rf=afrf;ri=86400;fo=1\""
    }

    uk_co_ystv_domainkey = {
      name     = "_domainkey.ystv.co.uk"
      content  = "\"t=y; o=~;\""
    }

    # Google DKIM record
    uk_co_ystv_domainkey_google = {
      name     = "google._domainkey.ystv.co.uk"
      content  = "\"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgMe769Vhe36+nWNXmUw4ooma5sBD8UbGofPfa592wdAiNYp+exs3jqaNY2knQTRS3tKsqANEpSKwlUzFt20xCnhpm3BaO0OJqu10BIn0Z3g3f4gkP6vhNjhDQGS8HisO12jh8bIwI6b4OoZz8q4o5tJyYlnaotgW/RmlK6LIUL8m8SR3FNNFFlZKJEqGjNNvC\" \"tLRdAx8anmqiGAFNGHiILqZo6wUHR3unMOE94sturLM4/nJ7T2+jt6AUxJPvrDK87QUSRgyhiAaGPKZqXojG11W9EA7EmdBKRZKmpmpzN1u8+8qA4CXPjhBTHXzPpzJnfEqvwfLTUYfbm4U0lskqwIDAQAB\""
    }

    # Exim DKIM record
    uk_co_ystv_domainkey_exim = {
      name     = "x._domainkey.ystv.co.uk"
      content  = "\"v=DKIM1; t=y; k=rsa; p=MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAzHPwjtjL4/dox3ou4bmI1/7ILBb26FD2qP8oboISHwn1plQy8U8u/DGW7RDCCfSgxRqCe60+HZ7pFECNVVQWxF/vxtEe0Oq6XdqG026vgGHv4gLfHRsNsz1yB870+x7awnMKoMimcCKrkb/tvTV2VTrbPYxRlt7iKxTD/caY/iPnhXOO5Ch7Ep1/16Km\" \"jxsqyuEZbLdDfq99vuObPcxheKuLA9l14/Z7Ens3JgMl58Ov3hJzG/41JisC/KyEAjc+KUGcH3SoMziT+HgSSr7ZYnhZEbEc32d4Vbo4GLxsY/PJxoP8+cHVZWjUjZW57BuSbz+N25Iexor/nt28sCNdcy0kMdkKhZaOAXsSbhqjfwNk8m/Ke1+HeQuJEcC794fKzSwLaXIm/F0PeKvbHWhFL3jIVwXKbnuzltPJZOXBKG4KuGdtdXJJ/JhqGMa\" \"EN/QkhQWKvCxP3lpei7RyjJxoRZkjZ/lswE8JnGQp4Bn1yei9lIL2yDd6tCkN0yDD1Em5WBD2boXci2Fuogu37tVvUSMUrlqpo2fYoCrAGyWhkkNIeZcvmeQi3th7DdZNwJjA3T53Lvi+Gc8Bl+sEKLAwaebKfJ+kTtiLFvdRPEPKzEP4/QqH6Dtl/jbffVnBrPhGzzmt/HoIHraZv37IBusaLEmvhf+OzX/fDQ/Zaik/x7sCAwEAAQ==\""
    }

    # Google site verification
    uk_co_ystv_google-site-verification_1 = {
      name     = "ystv.co.uk"
      content  = "\"google-site-verification=V7RU093Iui-9JGsqBipjCa65pP2AfPWNKIwE29QhBlE\""
    }

    # Google site verification
    uk_co_ystv_google-site-verification_2 = {
      name     = "ystv.co.uk"
      content  = "\"google-site-verification=7bvSZPUNbjpxlVanccsWI1jRxQg7gbVj5fnAKgl_iVo\""
    }

    # SPF policy
    uk_co_ystv_spf = {
      name     = "ystv.co.uk"
      content  = "\"v=spf1 a:smtp.ystv.co.uk a:ystv.co.uk include:_spf_outbound.york.ac.uk include:_spf.google.com -all\""
    }

    # Atlassian domain verification
    uk_co_ystv_atlassian-domain-verification = {
      name     = "ystv.co.uk"
      content  = "\"atlassian-domain-verification=/3uwVqQ9CiuSMENOPLQbWo/anEoiAXCmKMoM663URUAt7mWb6NydyI69jIW4G/hU\""
    }
  }
}

resource "cloudflare_dns_record" "records_txt_uk_co_ystv" {
  for_each = local.ystv_txt_records

  name     = each.value.name
  content  = each.value.content

  proxied  = false
  ttl      = 1
  type     = "TXT"
  zone_id  = var.ystv_co_uk_zone_id
  settings = {}
  comment  = var.dns_record_comment
  
}