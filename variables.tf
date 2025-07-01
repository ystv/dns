variable "dns_record_comment" {
  description = "A comment to apply to all DNS records"
  type        = string
  default     = "This record is managed by terraform @ ystv/dns, any changes here will be overriden."
}

variable "ystv_co_uk_zone_id" {
  description = "The DNS zone id for ystv.co.uk"
  type        = string
  default     = "3916beb27afd2f4341388237db0f698b"
}
