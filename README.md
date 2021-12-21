# terraform-template
my_testing_template


```
git clone https://github.com/cenzwong/terraform-template .
```


```
terraform init
terraform init update
terraform fmt # format 
terraform validate # and validate
terraform plan
terraform apply
terraform apply -auto-approve
terraform show
terraform state list
terraform destroy

terraform output resource_group_id

# other way to execute
terraform plan -out main.tfplan
terraform apply main.tfplan

terraform plan -destroy -out main.destroy.tfplan
terraform apply main.destroy.tfplan
```