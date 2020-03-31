# Terraform - EC2 - ROLE ACCESS S3

Este ejemplo tiene el codigo para crear:

 Una instancia EC2, VPC, subnet(Privada y Publica) y Securit Groups. Además de agregar un role a dicha instancia para utilizar el servicio S3. 

Para ejecutar esta plantilla de terraform se debe utilizar **tfvars-dev.json**

```
{
    "aws_region": "us-east-1",
    "aws_id": "id-owner-aws",
    "environment": "DEV",
    "ami": "ami-09a5b0b7edf08843d",
    "instance_type": "t2.micro",
    "key_name": "nombre-key-creada-previamente-en-AWS",
    "vpc_cidr": "10.0.0.0/16",
    "cidr_private": "10.0.1.0/24",
    "cidr_public": "10.0.2.0/24",
    "enable_dns_hostnames": true,
    "enable_dns_support": true,
    "associate_public_ip_address": true,
    "name_role": "RoleWebS3FullAccess"
}
```

Luego ejecutar los siguientes comandos de terraform

```
terraform init
terraform plan -var-file="./tfvars-dev.json"
terraform apply -var-file="./tfvars-dev.json" -auto-approve
```
