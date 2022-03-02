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
    export TF_VAR_{name_of_variable}=8080
    ```
    * default value
    * if no default value than terafform will promt for it after command 'plan' or 'apply'
    * as a parameter with command 'plan' or 'apply':
    ```bash
    terraform plan -var "name_of_var=8080"
    terraform apply -var "name_of_var=8080"
    ``` 