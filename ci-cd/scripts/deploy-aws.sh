#!/bin/bash

# This script automates the deployment of AWS components using Terraform.

# Set the AWS region and profile
AWS_REGION="us-west-2"
AWS_PROFILE="default"

# Navigate to the Terraform directory
cd ../aws/terraform

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Validate the Terraform configuration
echo "Validating Terraform configuration..."
terraform validate

# Plan the deployment
echo "Planning the deployment..."
terraform plan -out=tfplan

# Apply the deployment
echo "Applying the deployment..."
terraform apply tfplan

# Clean up
echo "Cleaning up..."
rm tfplan

echo "AWS deployment completed successfully."