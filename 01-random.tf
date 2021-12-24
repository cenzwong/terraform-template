resource "random_string" "random" {
  length           = 16
  special          = false
  override_special = "-"
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}
