variable "cloudflare_record" {
  type = list(object({
    resource = optional(string)
    name     = string
    ttl      = optional(number, 1)
    type     = string
    value    = optional(string, null)
    priority = optional(number, null)
    proxied  = optional(bool, false)
    comment  = optional(string, "")
    data = optional(object({
      algorithm      = optional(number, 0)
      altitude       = optional(number, 0)
      digest_type    = optional(number, 0)
      key_tag        = optional(number, 0)
      lat_degrees    = optional(number, 0)
      lat_minutes    = optional(number, 0)
      lat_seconds    = optional(number, 0)
      long_degrees   = optional(number, 0)
      long_minutes   = optional(number, 0)
      long_seconds   = optional(number, 0)
      matching_type  = optional(number, 0)
      name           = optional(string, null)
      order          = optional(number, 0)
      port           = optional(number, null)
      precision_horz = optional(number, 0)
      precision_vert = optional(number, 0)
      preference     = optional(number, 0)
      priority       = optional(number, 100)
      proto          = optional(string, null)
      protocol       = optional(number, 0)
      selector       = optional(number, 0)
      service        = optional(string, null)
      size           = optional(number, 0)
      target         = optional(string, null)
      type           = optional(number, 0)
      usage          = optional(number, 0)
      weight         = optional(number, 1)
    }), null)
  }))

  default = []

  description = "Cloudflare zone records"
}
