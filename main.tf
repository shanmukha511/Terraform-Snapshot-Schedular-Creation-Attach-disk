module "Snapshot-Shedular-Creation" {
  source = "./Snapshot-Shedular-Creation"

  name                     = "${var.name}"
  region                   = "${var.region}"
  hours_in_cycle           = "${var.hours_in_cycle}"
  start_time               = "${var.start_time}"
  max_retention_days       = "${var.max_retention_days}"
  on_source_disk_delete    = "${var.on_source_disk_delete}"
  storage_locations        = "${var.storage_locations}"
  guest_flush              = "${var.guest_flush}"

}

module "attach-disk-to-snapshot-schedular" {
  source = "./attach-disk-to-snapshot-schedular"

  name                     = "${var.name}"
  region                   = "${var.region}"
  hours_in_cycle           = "${var.hours_in_cycle}"
  start_time               = "${var.start_time}"
  max_retention_days       = "${var.max_retention_days}"
  on_source_disk_delete    = "${var.on_source_disk_delete}"
  storage_locations        = "${var.storage_locations}"
  guest_flush              = "${var.guest_flush}"
  disk_name                = "${var.disk_name}"
  zone                     = "${var.zone}"
}
