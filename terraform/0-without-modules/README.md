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
>  -e AWS_ACCESS_KEY_ID='_{{access-key-id}}_' \
>  -e AWS_SECRET_ACCESS_KEY='_{{secret-access-key}}_' \
>  -it hashicorp/terraform:latest **init**

> docker run -v $(pwd):/workspace -w /workspace \
>  -e AWS_ACCESS_KEY_ID='_{{access-key-id}}_' \
>  -e AWS_SECRET_ACCESS_KEY='_{{secret-access-key}}_' \
>  -it hashicorp/terraform:latest **plan**

> docker run -v $(pwd):/workspace -w /workspace \
>  -e AWS_ACCESS_KEY_ID='_{{access-key-id}}_' \
>  -e AWS_SECRET_ACCESS_KEY='_{{secret-access-key}}_' \
>  -it hashicorp/terraform:latest **apply**

You might use auto aprove on apply
> --auto-approve


> docker run -v $(pwd):/workspace -w /workspace \
>  -e AWS_ACCESS_KEY_ID='_{{access-key-id}}_' \
>  -e AWS_SECRET_ACCESS_KEY='_{{secret-access-key}}_' \
>  -it hashicorp/terraform:latest **destroy**

-----

#### AWS CLI on wsl2

##### Install
> sudo apt install awscli

##### Config
> aws configure

##### Check
> cat ~/.aws/config

> cat ~/.aws/credentials


#### aws-iam-authenticator

Must install aws-iam-authenticator

##### Check
> aws-iam-authenticator help

#### kubectl

Must install kubectl as well.

After apply, copy and kubeconfig to ~/.kube/config 
> cp kubeconfig  ~/.kube/config 

##### Check
> kubectl get nodes

##### Deploy Nginx to validade the cluster

> kubectl create deploy nginx --image=nginx
> kubectl get po
> kubectl port-forward pod/{{pod-name}} 8181:80

Access using a browser localhost:8181

Nginx home page must be displayed


