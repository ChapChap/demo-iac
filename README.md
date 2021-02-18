# Demo IaC

## Prerequisites

1. Tfstate Bucket creation (manual)
2. gcloud auth application-default login

## Setting up

```plaintext
.
├── README.md
├── backend.tf
├── main.tf
├── main.tfvars
├── outputs.tf
├── provider.tf
└── variables.tf
```

`backend.tf` to point to gcs bucket to store remote state
`main.tf` where to create things 🏗
`main.tfvars` to set values to variables
`outputs.tf` to outputs some usefull infos
`provider.tf` to indicate terraform to use `hashicorp/google` plugin
`variables.tf` where to store variables schema with description