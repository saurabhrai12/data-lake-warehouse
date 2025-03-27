#!/bin/bash

# Load Snowflake configuration
CONFIG_FILE="../snowflake/config/snowflake_config.json"
SNOWFLAKE_ACCOUNT=$(jq -r '.account' $CONFIG_FILE)
SNOWFLAKE_USER=$(jq -r '.user' $CONFIG_FILE)
SNOWFLAKE_PASSWORD=$(jq -r '.password' $CONFIG_FILE)
SNOWFLAKE_DATABASE=$(jq -r '.database' $CONFIG_FILE)
SNOWFLAKE_SCHEMA=$(jq -r '.schema' $CONFIG_FILE)

# Connect to Snowflake and execute SQL scripts
SNOWSQL_CMD="snowsql -a $SNOWFLAKE_ACCOUNT -u $SNOWFLAKE_USER -p $SNOWFLAKE_PASSWORD -d $SNOWFLAKE_DATABASE -s $SNOWFLAKE_SCHEMA"

# Create schema
echo "Creating schema..."
$SNOWSQL_CMD -f ../snowflake/scripts/create_schema.sql

# Create tables
echo "Creating tables..."
$SNOWSQL_CMD -f ../snowflake/scripts/create_tables.sql

# Load data
echo "Loading data..."
$SNOWSQL_CMD -f ../snowflake/scripts/load_data.sql

echo "Snowflake deployment completed successfully."