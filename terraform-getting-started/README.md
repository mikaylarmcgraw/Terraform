# Terraform - Getting Started

## What is Infrastructure as Code?

Provisioning infrastructure through software to achieve consistent and predictable enviornments.

## Terraform Core Concepts

- **Defined in code:** Infrastructure as code is definied in code, you are going to be writing code to define your infrastrucutre.

- **Storied in source control:** You should be storing this code in a versioned source control repository.

- **Declarative or imperative:** You can define infrastructure as code both declatative and imperartive. In a **declarative approach**, you specify what you want the end state of your infrastructure to be, and Terraform figures out how to achieve that state. In a **imperative approach**, you define the sequence of steps to achieve the desired infrastructure state. This is less common in Terraform but can be achieved using the `null_resource` and `provisioner` blocks.

- **Idempotent and consistent:** Terraform is idempotent which means that performing an action multiple times has the same result as performing it once.

- **Push or pull:** In a push scenerio you send your Terraform configurations to a central server or service, and it applies the changes on your behalf. In a pull scenerio each individual machine or node periodically checks for the latest Terraform configurations from a central repository and applies them locally.

## Infrastructure as Code Benefits:

- Reusable components
- Automated deployments
- Repeatable process
- Consistent environments
- Documented architecture
