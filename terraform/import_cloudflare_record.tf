import {
  for_each = local.records
  to       = cloudflare_record.this[each.key]
  id       = "${data.cloudflare_zone.zone.id}/${each.value.resource}"
}
