resource "google_compute_resource_policy" "schedular" {
  name   = "${var.name}"
  region = "${var.region}"
  snapshot_schedule_policy {
    schedule {
      hourly_schedule {
        hours_in_cycle = "${var.hours_in_cycle}"
        start_time     = "${var.start_time}"
      }
    }
    retention_policy {
      max_retention_days    = "${var.max_retention_days}"
      on_source_disk_delete = "${var.on_source_disk_delete}"
    }
    snapshot_properties {
      labels = {
        my_label = "value"
      }
      storage_locations = "${var.storage_locations}"
      guest_flush       = "${var.guest_flush}"
         }
  }
}
resource "google_compute_disk_resource_policy_attachment" "attachment" {
  count = length(var.disk_name)
  name = google_compute_resource_policy.schedular.name
  disk = var.disk_name[count.index]
  zone = "${var.zone}"
}
