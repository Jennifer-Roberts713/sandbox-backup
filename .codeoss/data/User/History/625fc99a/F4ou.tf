terraform {
  backend "gcs" {
    bucket = "tf-state-playground-s-11-9236d5e5"
    prefix = "shopeasy/state"
  }
}