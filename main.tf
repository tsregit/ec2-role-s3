module "instance_ec2" {
  source = "./modules/ec2"
  vpc_cidr = var.vpc_cidr
  key_name = var.key_name
  instance_type = var.instance_type
  ami = var.ami
  cidr_private = var.cidr_private
  cidr_public = var.cidr_public
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
  associate_public_ip_address = var.associate_public_ip_address
  name_role = var.name_role
  tags = {
    "vpc": merge({
          Name = "${local.name_prefix}-VPC"
          },
          local.default_tags,
          ),
    "ig": merge({
            Name = "${local.name_prefix}-IG"
          },
          local.default_tags,
          ),
    "subnet_prublic": merge({
                        Name = "${local.name_prefix}-${var.cidr_public}-${var.aws_region}-PUBLIC"
                      },
                      local.default_tags,
                      ),
    "subnet_private": merge({
                        Name = "${local.name_prefix}-${var.cidr_public}-${var.aws_region}-PRIVATE"
                      },
                      local.default_tags,
                      ),
    "sg": merge({
            Name = "${local.name_prefix}-SG"
          },
          local.default_tags,
          ),
    "ec2": merge({
              Name = "WebServerPublic2"
          },
          local.default_tags,
          )
  }
}