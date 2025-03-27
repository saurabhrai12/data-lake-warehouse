def lambda_handler(event, context):
    # Log the incoming event
    print("Received event: " + str(event))

    # Example: Process the event and trigger actions
    try:
        # Your processing logic here
        # For example, extracting data from the event
        data = event['Records'][0]['S3']['object']['key']
        print(f"Processing data from S3 object: {data}")

        # Add your logic to interact with Snowflake or other services here

        return {
            'statusCode': 200,
            'body': 'Processing completed successfully.'
        }
    except Exception as e:
        print(f"Error processing event: {str(e)}")
        return {
            'statusCode': 500,
            'body': 'Error processing event.'
        }