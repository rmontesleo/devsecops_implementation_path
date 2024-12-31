# Terraform In the Cloud

##

### Get the code from the GitHub
```bash

git branch
git swithch exercises
```


```bash
# Terraform is directory specific
cd 0000-setup

terraform version

terraform init

# to see the golang downloaded
tree -a


# 
terraform plan

terraform apply

# executed a second time, with no change
terraform apply

# add a new tag from console and see what happend when apply again
terraform apply

terraform apply -auto-approve

#
terraform -help

# 
terraform destroy

# 2 IMPORTANT THINGS  TO REMEMBER ! ! !
# 1) Terraform know what allready has done
# 2) script is the source of true

# Security group is a network rule
# Data is great use case to get information about cloud elements
# Data is a way to inject cloud information inside the 


# we can override the variables in the execution
terraform apply -var port=8080

# also can override the default value with environment variables
# we can use many vaults or other resources to read env variables.
# using TF_VAR_ then the name of the variable
export TF_VAR_port=7000
terraform apply


```

### Other commands executed in sample
```bash

# to see final results use git stage


#
ghcs "how to cut the grep result to avoid display the hole string the execution was env | grep aws"

#
 env  | cut -d '=' -f 1

# list all you ec2 instances
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,Tags[?Key==`Name`].Value|[0]]' --output table

# List all vpc in your infrastructure
aws ec2 describe-vpcs --output json

#
git stash

```


## Rererences

### OReilly
- [Terraform In the Cloud](https://learning.oreilly.com/live-events/terraform-in-the-cloud/0636920401407/0642572001786/)
- [terraform-workshop](https://github.com/looselytyped/terraform-workshop)
- [PDF Slides](https://on24static.akamaized.net/event/46/01/19/3/rt/1/documents/resourceList1720545405620/terraformingyourcloud11720545405620.pdf)
- [Head First Software Architecture](https://learning.oreilly.com/library/view/head-first-software/9781098134341/)
- [Terraform Cookbook](https://learning.oreilly.com/library/view/terraform-cookbook/9781098108458/)
- [Mastering Terraform](https://learning.oreilly.com/library/view/mastering-terraform/9781835086018/)
- [Architecting AWS with Terraform](https://learning.oreilly.com/library/view/architecting-aws-with/9781803248561/)
- [Terraform: Up and Running, 3rd Edition](https://learning.oreilly.com/library/view/terraform-up-and/9781098116736/)
- [Terraform: Up & Running, 2nd Edition](https://learning.oreilly.com/library/view/terraform-up/9781492046899/)




### Terraform
- [Tests](https://developer.hashicorp.com/terraform/language/tests)
- [Argument Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#argument-reference)
- [Should .terraform.lock.hcl be included in the .gitignore file?](https://dev.to/techielass/should-terraformlockhcl-be-included-in-the-gitignore-file-5aa0)


### Terragrunt
- [Terragrunt](https://terragrunt.gruntwork.io/)


### Cisco
- [Application Centric Infrastructure (ACI)](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs)

### GitHub
- [terraform-provider-github](https://github.com/integrations/terraform-provider-github)
- [github_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)
- [GitHub Provider](https://registry.terraform.io/providers/integrations/github/latest/docs)
- [Managing GitHub with Terraform](https://www.hashicorp.com/blog/managing-github-with-terraform)
- [terratest]()

### AWS
- [Configuration and credential file settings in the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

### IBM
- [IBM to Acquire HashiCorp, Inc. Creating a Comprehensive End-to-End Hybrid Cloud Platform](https://newsroom.ibm.com/2024-04-24-IBM-to-Acquire-HashiCorp-Inc-Creating-a-Comprehensive-End-to-End-Hybrid-Cloud-Platform)

### Web
- [Schutzstaffel](https://en.wikipedia.org/wiki/Schutzstaffel)
- [What IBM’s Deal For HashiCorp Means For The Cloud Infra Battle](https://www.forbes.com/sites/rscottraynovich/2024/04/25/what-ibms-deal-for-hashicorp-means-for-the-cloud-infra-battle/)

### Solving Issues
- [Create multiple rules in AWS security Group](https://stackoverflow.com/questions/62575544/create-multiple-rules-in-aws-security-group)
- [Consider security groups with source security groups when hashing #2376](https://github.com/hashicorp/terraform/pull/2376)


- [What is the best practise with .terraform.lock.hcl in modules … commit or not?](https://discuss.hashicorp.com/t/what-is-the-best-practise-with-terraform-lock-hcl-in-modules-commit-or-not/28648)
- [Should .terraform.lock.hcl be included in the .gitignore file?](https://stackoverflow.com/questions/67963719/should-terraform-lock-hcl-be-included-in-the-gitignore-file)
- []()