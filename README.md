# cloudific Secure Cloud Monitor Project

## Overview

The cloudific Secure Cloud Monitor Monitor project is designed to enhance the security and monitoring capabilities of cloud infrastructure on AWS. It aims to provide a robust, scalable, and cost-effective observability framework, incorporating AWS-native services and Aviatrix for advanced network security. This initiative addresses the need for improved resilience and threat management following a DDoS attack that highlighted vulnerabilities in the existing setup.

## Components

- **Amazon ECS**: Container management service that supports Docker containers.
- **Amazon CloudWatch**: Monitoring service for AWS cloud resources and applications.
- **AWS WAF and Shield**: Services providing protection against DDoS attacks and other web exploits.
- **AWS IAM**: Manages access to AWS services and resources securely.
- **AWS VPC**: Isolates cloud resources with virtual networking environment.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account with appropriate permissions to create the necessary resources.
- Terraform installed on your machine. Visit Terraform's website for download instructions.
- Configure your AWS CLI with credentials that have necessary permissions.

## Repository Structure

- **/modules**: Contains all Terraform configuration files.
- **/.github/workflows**: Contains scripts for CI/CD integration and other automation tasks.
- **/SAD.md**: Documentation files and additional resources.
- **main.tf**: main file for infrastructure provisioning.
- **provisioners.tf**: provisioning.

## Setup Instructions

1. **Steps to configure GitHub Secrets:**

- **Go to your GitHub repository**: Navigate to the GitHub repository where your project is hosted.
- **Settings**: Click on the **Settings** tab at the top of the repository.
- **Secrets**: From the sidebar, select **Secrets & variables** > **Actions**.
- **New repository secret**: Click on **New repository secret** to add each of the following:
  - `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
    - `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
    - `DOCKER_PASSWORD`: Your docker password.
    - `DOCKER_USERNAME`: Your docker username.
    - Enter the **Name** and **Value** for each secret and click **Add secret**.
    - These secrets can then be used in your GitHub Actions workflows without exposing them in your logs or repository files.

2.**Clone the Repository**:

    `git clone https://github.com/alvo254/cloudific.git cd securecloud-monitor`

3.**Initialize Terraform**: Navigate to the Terraform directory and run the initialization command. This will download all necessary Terraform providers

    `cd terraform terraform init`

4.**Configure AWS Credentials**: Make sure your AWS credentials are configured by setting up the AWS CLI or by setting environment variables:

    `export AWS_ACCESS_KEY_ID="your-access-key-id" export AWS_SECRET_ACCESS_KEY="your-secret-access-key" export AWS_DEFAULT_REGION="us-east-1"`

5.**Plan the Deployment**: Check the execution plan to see the resources Terraform plans to create:

    `terraform plan`

6.**Apply the Configuration**: Deploy your infrastructure:

    `terraform apply` or `terraform apply -auto-approve` to skip the prompt
    
    When prompted, type `yes` to proceed with the creation of resources.

7.**Verify Deployment**: After Terraform successfully applies the configuration, verify that all resources are created and functioning as expected in the AWS Management Console.

## CI/CD Integration

This project uses GitHub Actions for CI/CD. The workflows located in the `.github/workflows` directory facilitate the automation of build, test, and deployment processes.

- Review and adapt the pipeline scripts as necessary.
- Ensure all environment variables and secrets are configured in your GitHub repository settings.

## Maintenance and Monitoring

- Regularly update and review AWS CloudWatch for insights.
- Set CloudWatch alarms to notify on critical issues.
- Use AWS Config for continuous compliance monitoring.

## Documentation and Training

- Keep all project documentation updated within the `/docs` solutions architect document.
