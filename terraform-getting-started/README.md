# Terraform - Getting Started <!-- omit from toc -->

## Table of Contents <!-- omit from toc -->

1. [What is Terraform?](#what-is-terraform)
2. [What is Infrastructure as Code?](#what-is-infrastructure-as-code)
3. [Terraform Core Concepts](#terraform-core-concepts)
4. [Infrastructure as Code Benefits](#infrastructure-as-code-benefits)
5. [Terraform Object Types](#terraform-object-types)
6. [Block Syntax](#block-syntax)
7. [Terraform Workflow](#terraform-workflow)

## What is Terraform?

Terraform is an open source infrastructure automation tool.

## What is Infrastructure as Code?

Provisioning infrastructure through software to achieve consistent and predictable environments.

## Terraform Core Concepts

- **Defined in code:** Infrastructure as code is defined in code, you are going to be writing code to define your infrastructure.

- **Storied in source control:** You should be storing this code in a versioned source control repository.

- **Declarative or imperative:** You can define infrastructure as code both declarative and imperative. In a **declarative approach**, you specify what you want the end state of your infrastructure to be, and Terraform figures out how to achieve that state. In a **imperative approach**, you define the sequence of steps to achieve the desired infrastructure state. This is less common in Terraform but can be achieved using the `null_resource` and `provisioner` blocks.

- **Idempotent and consistent:** Terraform is idempotent which means that performing an action multiple times has the same result as performing it once.

- **Push or pull:** In a push scenario you send your Terraform configurations to a central server or service, and it applies the changes on your behalf. In a pull scenario each individual machine or node periodically checks for the latest Terraform configurations from a central repository and applies them locally.

## Infrastructure as Code Benefits:

- Reusable components
- Automated deployments
- Repeatable process
- Consistent environments
- Documented architecture

## Terraform Object Types

- **Providers:** A provider in Terraform is like a bridge between your Terraform configurations and the services or resources you want to manage (e.g., AWS, Azure, Google Cloud, etc.).

- **Resources:** A resource is a block of code in your Terraform configuration that describes a particular piece of infrastructure. Example of what an AWS S3 bucket would look like:

```
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-bucket"
  acl    = "private"
}
```

- **Data sources:** a data source in Terraform allows you to query and retrieve information from external systems or services, providing a way to dynamically incorporate existing data into your infrastructure code. A Example of retrieving information about an AWS Amazon Machine Image:

```
data "aws_ami" "latest_amazon_linux" {
most_recent = true

owners = ["amazon"]

filter {
name = "name"
values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}
```

## Block Syntax

Block syntax is used to define different parts of the configuration. Blocks are the fundamental structure of Terraform code, and they define resources, data sources, variables, outputs, providers, and other elements.

Example syntax for a block in Terraform:

```
block_type "block_label" "block_name" {
  key = "value"
  nested_block {
    key = "value"
  }
}
```

- `block_type:` Specifies the type of block, such as resource, data, variable, output, or provider.

- `block_label:` Provides a label or type qualifier for the block. For example, the label in a resource block might be the type of resource (e.g., aws_instance). In a data block, it might be the type of data source (e.g., aws_subnet).

- `block_name:` Assigns a name or identifier to the block. This is a user defined label for the specific instance of the block. For resources and data sources, it is typically used as a reference elsewhere in the configuration.

- `{}:` The curly braces contain the configuration settings and attributes specific to the block type. Inside these braces, you define the properties, parameters, and values.

# Terraform Workflow

- `terraform init`: Initializes a Terraform working directory. This command is used to set up the working directory with the necessary configurations and modules, downloading provider plugins and initializing the Terraform backend.

- `terraform plan`: Creates an execution plan for applying changes to the infrastructure. This command examines the Terraform configuration, checks the current state, and produces an execution plan detailing what actions Terraform will take to achieve the desired state.

- `terraform apply`: Applies the changes specified in the execution plan. This command prompts for confirmation before making any changes, and once confirmed, Terraform applies the changes, creating, modifying, or deleting resources as necessary.

- `terraform destroy`: This command is used to tear down or destroy the infrastructure that was created using the terraform apply command.
