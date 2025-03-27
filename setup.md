# Setup Instructions for Snowflake Data Lake Data Warehouse Project

## Prerequisites
Before setting up the project, ensure you have the following installed:

1. **Git**: For version control.
2. **Terraform**: For managing AWS infrastructure.
3. **AWS CLI**: For interacting with AWS services.
4. **SnowSQL**: For executing Snowflake SQL commands.
5. **Python 3.x**: For running transformation scripts.
6. **Jenkins**: For CI/CD pipeline automation.

## Installation Steps

1. **Clone the Repository**
   Clone the project repository to your local machine using the following command:
   ```
   git clone https://github.com/yourusername/snowflake-data-lake-warehouse.git
   cd snowflake-data-lake-warehouse
   ```

2. **Set Up AWS Resources**
   Navigate to the AWS Terraform directory and initialize Terraform:
   ```
   cd aws/terraform
   terraform init
   ```
   Then, apply the Terraform configuration to provision the necessary AWS resources:
   ```
   terraform apply
   ```

3. **Configure Snowflake**
   Update the `snowflake_config.json` file located in the `snowflake/config` directory with your Snowflake account details:
   ```json
   {
       "account": "your_account",
       "user": "your_username",
       "password": "your_password",
       "warehouse": "your_warehouse",
       "database": "your_database",
       "schema": "your_schema"
   }
   ```

4. **Deploy Snowflake Components**
   Execute the deployment script to create schemas and load data into Snowflake:
   ```
   cd ../../ci-cd/scripts
   ./deploy-snowflake.sh
   ```

5. **Deploy AWS Components**
   If you have any AWS Lambda functions or other components to deploy, run the following script:
   ```
   ./deploy-aws.sh
   ```

## Configuration Details
- Ensure that your AWS credentials are configured in the AWS CLI. You can do this by running:
  ```
  aws configure
  ```
- Make sure to set the appropriate permissions for the IAM roles used in your AWS resources.

## Usage Guidelines
- Use the provided transformation scripts in the `transformations` directory to process data before loading it into Snowflake.
- Monitor the CI/CD pipeline in Jenkins for automated deployments and error handling.

## Conclusion
Follow these steps to set up the Snowflake Data Lake Data Warehouse project successfully. For any issues, refer to the README file for further guidance or consult the documentation for the respective tools used in this project.