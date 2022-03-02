# Terraform
First steps in terraform environment.

# Lesson 1
## provision EC2 instance (t2.micro) in eu-central-1
* "terraform init" to init provider plugins (AWS)
* "terraform plan" to check what will be done/provision
* "terraform apply" to run code
## add 'hello world'
* add aws security group to open 8080 port
* add security group to ec2 vcp_security_group_ids
* variables and how to provide it:
    * environment var
    ```bash
    export TF_VAR_name_of_variable=8080
    ```
    * default value
    * if no default value than terafform will promt for it after command 'plan' or 'apply'
    * as a parameter with command 'plan' or 'apply':
    ```bash
    terraform plan -var "name_of_var=8080"
    terraform apply -var "name_of_var=8080"
    ```
# Lesson 2
## Web server on cluster
* ASG - auto scaling group of servers on AWS
* lifecycle - parameter. By dafault terrafrom destroy before create. Can be change by set:
  ```tf
  lifecycle {
      create_before_destroy = true
  }
  ```
* "data source". Data can be pulled from provider. E.g about subnets:
  ```tf
  data "provider_type" "name"{
      [configuration]
  }
  ```
* variables can (and should) be keep in separate file "variables.tf"
* output can (and should) be keep in separate file "output.tf"
## add load balancer
* On AWS use ALB for web apps
* 