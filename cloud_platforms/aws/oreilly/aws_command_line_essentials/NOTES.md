# AWS Command Line Essentials

## Practices on the class

### Practice one
1. Go to AWS Console like administrator
2. Go to IAM section
3. Create a new user call ted with out console optins (not check)
4. create with out password or any permitions and review the user creation.
5. After that attach the permition of AdministratorAccess
6. Add access keys the CLI option


### Command structure and samples
```bash
# Basic structure
aws [service (command)] [operation (subcommand)]

aws ec2 describe-instances

# be carefull to show the result of this command
aws iam list-access-keys

# many times the default is json
aws iam list-users | jq

# overriding to yaml, table or text format
aws iam list-users --output yaml
aws iam list-users --output table
aws iam list-users --output text

# getting help
aws help
aws help | less
aws help | more

```

### CLI sytax
-> describe
-> --output : is used to overided the result output
-> --query
-> $=

### Configuring profiles and define variables
```bash

aws configure --profile $account1

aws s3 ls  --profile $account1

# store the result in some variable
vpcid=$( store command-line results)

echo $vpcid

```

### VPC Commands
```bash
#
aws ec2 create-vpc --cidr-block 10.0.0.0/16

# Define a variable that will store the ARN of the VPC
vpcid=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query Vpc.VpcId --output text)

# Create a basic VPC and output the Amazon Resource Number
aws ec2 create-vpc \
--cidr-block 10.0.0.0/16 \
--query 'Vpc.{VpcId:VpcId}' \
--output text

# add a name (tag) to a VPC
aws ec2 create-tags --resources $vpcid --tags Key=Name,Value=Dev

# Add a subnet for infrastructure components
inf=$(aws ec2 create-subnet --vpc-id $vpcid --cidr-block 10.0.1.0/24 --availability-zone us-east-1a --query 'Subnet.{SubnetId:SubnetId}' --output text ) 

# Add a subnet for web servers
web=$(aws ec2 create-subnet --vpc-id $vpcid --cidr-block 10.0.2.0/24 --availability-zone us-east-1a --query 'Subnet.{SubnetId:SubnetId}' --output text )

# Add a subnet for the primary database server
db=$(aws ec2 create-subnet --vpc-id $vpcid --cidr-block 10.0.3.0/24 --availability-zone us-east-1a --query 'Subnet.{SubnetId:SubnetId}' --output text )

# subnet to see the full ouput
aws ec2 create-subnet --vpc-id $vpcid --cidr-block 10.0.5.0/24 --availability-zone us-east-1b 

# Order an Internet Gateway
igw_id=$(aws ec2 create-internet-gateway --query 'InternetGateway.{InternetGatewayId:InternetGatewayId}' --output text )

# Attach Internet Gateway
aws ec2 attach-internet-gateway --internet-gateway-id $igw_id --vpc-id $vpcid

# Create custom route table
 routetableid=$(aws ec2 create-route-table --vpc-id $vpcid --query 'RouteTable.{RouteTableId:RouteTableId}' --output text )

# Create custom route table entry to enable Internet access
aws ec2 create-route --route-table-id $routetableid --destination-cidr-block 0.0.0.0/0 --gateway-id $igw_id

# Create custom route table with INF subnet
aws ec2 associate-route-table --subnet-id $inf --route-table-id $routetableid

```

### EC2 Commands
```bash
# Key pair 
key=$(aws ec2 create-key-pair --key-name KeyPair --query 'KeyMaterial' --output text )

# adding quotes to the variable, allows the original content remains to write the pem file
echo "$key" > KeyPair.pem
chmod 400 KeyPair.pem



# Security group, then you must get the value of the security group id , and put into a variable
aws ec2 create-security-group --vpc-id $vpcid --group-name security-group-22 --description "admin access port 22"

# another way to do it..(verify this)
sg_id=$(aws ec2 create-security-group --vpc-id $vpcid --group-name security-group-22 --description "admin access port 22"  --query 'GroupId' --output text  )

# Add security group rule
aws ec2 describe-security-groups --group-ids $sg_id
aws ec2 authorize-security-group-ingress --group-id $sg_id --protocol tcp --port 22 --cidr 0.0.0.0/0


# Create EC2 instance in private subnet, this approach is old school

instance_type="t2.micro"

# this is an Ubuntu image
image_id="ami-07ebfd5b3428b6f4d"

# this is the name save in AWS
key_name="KeyPair"

# assign an a public ip
aws ec2 run-instances \
--image-id $image_id \
--count 1 \
--instance-type  $instance_type \
--key-name   $key_name \
--security-group-ids $sg_id \
--subnet-id  $inf \
--associate-public-ip-address 

# explicitly avoid assign an a public ip
aws ec2 run-instances \
--image-id $image_id \
--count 1 \
--instance-type  $instance_type \
--key-name   $key_name \
--security-group-ids $sg_id \
--subnet-id  $inf \
--no-associate-public-ip-address


# TODO: Verify how to use template to create an instance


# describe-instances list your aws ec2 instances
aws ec2 describe-instances

# TODO: Verify how to add tags to the ec2 instances when they are created and after creation
aws ec2 describe-instances --filter Name=tag:Name,Values=dev-server


# Create AMI

# TODO: Pending in how to create an AMI
aws ec2 describe-instances

# TODO: Pending get the cli execution to get the id of an specific ec2 instance
instance_id=$()

aws ec2 create-image --instance-id $instance_id --name "My server" --description "An AMI for my server"


```



---

## Other commands

### IAM Policy
```bash

```

### VPC
```bash

```

### AWS Organizations
```bash

```

### Create S3 Bucket
```bash

```

### AWS Lambda
```bash

```

### List CloudTrail events
```bash

```

### Create Application Load Balancer
```bash

```

### Create Target Group
```bash

```

### Create Launch Configuration
```bash

```

### Create Auto Scaling Group
```bash

```

### AWS CLI skeleton
```bash

```

### CLI Skeleton file for EC2 instances
```bash

```

### Generationg a command skeleton
```bash

```

### Customizing the parameter file
```bash

```

### Run the command with Dry Run
```bash

```

### AWS CloudFormation
```bash

```



### using q in Cloudshell
```bash
# To disble the inline suggestions
q inline disable

# to enable the inline suggestions
q inline enable
```



## Resources

- [AWS Command Line Essentials](https://learning.oreilly.com/live-events/aws-command-line-essentials/0636920069699/0642572007102/)
- [PDF](https://on24static.akamaized.net/event/46/84/11/5/rt/1/documents/resourceList1730297690292/usingtheawscli20231730297690292.pdf)
- [AWS CLI Command References](https://awscli.amazonaws.com/v2/documentation/api/latest/index.html)
- [Configuring IAM Identity Center authentication with the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)
- [Configuring command completion on Linux or macOS](https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-completion.html#cli-command-completion-linux)
- [Using Amazon Q CLI in CloudShell](https://docs.aws.amazon.com/cloudshell/latest/userguide/q-cli-features-in-cloudshell.html#required-IAM-permissions)
- [Translating from natural language to bash](https://docs.aws.amazon.com/en_us/amazonq/latest/qdeveloper-ug/command-line-conversation.html)


## Solving Issues
- [Preserve Linebreaks When Storing Command Output to a Variable](https://www.baeldung.com/linux/variable-preserve-linebreaks)
- [Inserting a Newline in a Variable in Bash](https://www.baeldung.com/linux/add-newline-variable-bash)

## Linux
- [Bash Read Lines Into Multiple Variables Made Easy](https://bashcommands.com/bash-read-lines-into-multiple-variables)