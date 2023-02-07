# Terraform - local

<p style="float:left">
    <img src="https://img.shields.io/badge/FullCycle-000000?style=plastic"  /> 
    <img src="https://img.shields.io/badge/Terraform-7B42BC?style=plastic&logo=Terraform&logoColor=white" /> 
</p>

#### Run using docker and terraform image


> docker pull hashicorp/terraform

> docker run -v $(pwd):/workspace -w /workspace -it hashicorp/terraform:latest init

> docker run -v $(pwd):/workspace -w /workspace -it hashicorp/terraform:latest plan

> docker run -v $(pwd):/workspace -w /workspace -it hashicorp/terraform:latest apply	