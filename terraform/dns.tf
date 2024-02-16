locals {
  records = {
    for index, record in var.cloudflare_record :
    record.type != "SRV" ? try(record.key, format("%s-%s-%s", record.name, record.type, record.value)) : try(record.key, format("%s-%s", record.name, record.type)) => record
  }
}

resource "cloudflare_record" "this" {
  for_each = local.records

  zone_id  = data.cloudflare_zone.zone.id
  name     = each.value.name
  type     = each.value.type
  value    = each.value.value
  priority = each.value.priority
  proxied  = each.value.proxied
  ttl      = each.value.ttl
  comment  = each.value.comment


  dynamic "data" {
    for_each = each.value.data != null ? [1] : []

    content {
      algorithm      = each.value.data.algorithm
      altitude       = each.value.data.altitude
      digest_type    = each.value.data.digest_type
      key_tag        = each.value.data.key_tag
      lat_degrees    = each.value.data.lat_degrees
      lat_minutes    = each.value.data.lat_minutes
      lat_seconds    = each.value.data.lat_seconds
      long_degrees   = each.value.data.long_degrees
      long_minutes   = each.value.data.long_minutes
      long_seconds   = each.value.data.long_seconds
      matching_type  = each.value.data.matching_type
      name           = each.value.data.name
      order          = each.value.data.order
      port           = each.value.data.port
      precision_horz = each.value.data.precision_horz
      precision_vert = each.value.data.precision_vert
      preference     = each.value.data.preference
      priority       = each.value.data.priority
      proto          = each.value.data.proto
      protocol       = each.value.data.protocol
      selector       = each.value.data.selector
      service        = each.value.data.service
      size           = each.value.data.size
      target         = each.value.data.target
      type           = each.value.data.type
      usage          = each.value.data.usage
      weight         = each.value.data.weight
    }
  }
}
