Enter your credential in provider.tf file

Need to install few tools in your system.
    1. terraform
    2. aws cli
    3. kubectl
    4. helm

For Deployment just run below command. you can create number of environment, just need to create qa.tfvars file.

    terraform init
    terraform plan -var-file="dev.tfvars" -out tfapply
    terraform apply "tfapply"

For Destroy infra run below command.

    terraform destroy -var-file="dev.tfvars" -auto-approve

Note:- in acm need to validate certificate with dns, currently we don't have any domain so we are not going to validate hear. after deployment done need to create cname entry in your dns, loadbalancer endpoint with domain name.

For Node auto scaling we have used karpenter, it's take less time to up node.
For monitoring and logging we have used cloudwatch.
For state file store we have number of options like s3 bucket and etc...

Basic tools installed like metrics server for hpa.