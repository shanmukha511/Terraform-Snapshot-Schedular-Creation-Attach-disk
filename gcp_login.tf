provider "google" {
 credentials = file("dummy-file.json")
 project     = "******"
 region      = "${var.region}"
}
