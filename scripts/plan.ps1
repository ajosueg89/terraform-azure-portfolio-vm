param(
  [string]$EnvPath = "environments/dev",
  [string]$TfVars = "dev.tfvars"
)

Push-Location $EnvPath
terraform init
terraform plan -var-file=$TfVars
Pop-Location
