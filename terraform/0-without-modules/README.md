# Terraform - Without modules

<p style="float:left">
    <img src="https://img.shields.io/badge/FullCycle-000000?style=plastic"  /> 
    <img src="https://img.shields.io/badge/Terraform-7B42BC?style=plastic&logo=Terraform&logoColor=white" /> 
</p>

#### Summary



-----

#### Run using docker and terraform image

> docker pull hashicorp/terraform

> docker run -v $(pwd):/workspace -w /workspace \
>  -e AWS_ACCESS_KEY_ID='{{access-key-id}}' \
>  -e AWS_SECRET_ACCESS_KEY='{{secret-access-key}}' \
>  -it hashicorp/terraform:latest init

> docker run -v $(pwd):/workspace -w /workspace \
>  -e AWS_ACCESS_KEY_ID='{{access-key-id}}' \
>  -e AWS_SECRET_ACCESS_KEY='{{secret-access-key}}' \
>  -it hashicorp/terraform:latest plan

> docker run -v $(pwd):/workspace -w /workspace \
>  -e AWS_ACCESS_KEY_ID='{{access-key-id}}' \
>  -e AWS_SECRET_ACCESS_KEY='{{secret-access-key}}' \
>  -it hashicorp/terraform:latest apply	

-----

#### AWS CLI on wsl2

##### Install
> sudo apt install awscli

##### Config
> aws configure

##### Check
> cat ~/.aws/config

> cat ~/.aws/credentials
