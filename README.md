# Snowflake Data Lake Data Warehouse Project

## Project Overview
This project is designed to create a Snowflake Data Lake and Data Warehouse integrated with AWS components. It utilizes Terraform for infrastructure provisioning and Jenkins for CI/CD pipeline automation. The project structure is organized into distinct folders for Snowflake scripts, AWS code, Terraform templates, transformation scripts, and CI/CD configurations.

## Project Structure
```
snowflake-data-lake-warehouse
├── aws
│   ├── lambda                # AWS Lambda function code
│   │   └── handler.py
│   ├── s3                    # Terraform configuration for S3
│   │   └── bucket-setup.tf
│   └── terraform             # Main Terraform configuration
│       └── main.tf
├── ci-cd                     # CI/CD pipeline configurations
│   ├── jenkins
│   │   └── Jenkinsfile
│   └── scripts               # Deployment scripts
│       ├── deploy-snowflake.sh
│       └── deploy-aws.sh
├── snowflake                 # Snowflake scripts and configurations
│   ├── scripts
│   │   ├── create_schema.sql
│   │   ├── create_tables.sql
│   │   └── load_data.sql
│   └── config
│       └── snowflake_config.json
├── transformations           # Data transformation scripts
│   ├── python
│   │   └── transform.py
│   └── sql
│       └── transform.sql
├── .gitignore                # Git ignore file
├── README.md                 # Project overview and setup instructions
└── setup.md                  # Detailed setup instructions
```

## Setup Instructions
1. **Prerequisites**
   - Ensure you have the following installed:
     - Terraform
     - AWS CLI
     - Snowflake CLI
     - Jenkins
     - Python (for transformation scripts)

2. **Installation Steps**
   - Clone the repository:
     ```
     git clone <repository-url>
     cd snowflake-data-lake-warehouse
     ```
   - Configure AWS credentials using the AWS CLI:
     ```
     aws configure
     ```
   - Set up Snowflake connection details in `snowflake/config/snowflake_config.json`.

3. **Deploying AWS Components**
   - Navigate to the `aws/terraform` directory and run:
     ```
     terraform init
     terraform apply
     ```

4. **Deploying Snowflake Components**
   - Execute the deployment script:
     ```
     ./ci-cd/scripts/deploy-snowflake.sh
     ```

5. **Running Transformations**
   - Use the transformation scripts located in the `transformations` directory as needed.

## Usage Guidelines
- Follow the branching strategy for Git:
  - Use `main` for stable releases.
  - Create `feature/*` branches for new features.
  - Use `release/*` branches for preparing releases.
- Ensure to run tests and code quality checks before merging branches.

## Best Practices
- Use secure credentials for AWS and Snowflake.
- Regularly monitor logs for both AWS and Snowflake operations.
- Keep the project dependencies updated and maintain code quality through linting and testing.

For more detailed setup instructions, refer to the `setup.md` file.