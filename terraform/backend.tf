terraform {
  backend "gcs" {
    bucket = "demo-iac-tfstate"
    prefix = "hello-world"
  }
}
