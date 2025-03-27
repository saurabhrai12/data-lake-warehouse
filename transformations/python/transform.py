import pandas as pd

def load_data(file_path):
    """Load data from a CSV file."""
    return pd.read_csv(file_path)

def transform_data(df):
    """Transform the data as per business logic."""
    # Example transformation: Convert column names to lowercase
    df.columns = [col.lower() for col in df.columns]
    
    # Add more transformation logic as needed
    # For example, filtering, aggregating, or creating new columns
    return df

def save_transformed_data(df, output_path):
    """Save the transformed data to a new CSV file."""
    df.to_csv(output_path, index=False)

if __name__ == "__main__":
    input_file = 'path/to/input_file.csv'  # Specify the input file path
    output_file = 'path/to/output_file.csv'  # Specify the output file path
    
    # Load the data
    data = load_data(input_file)
    
    # Transform the data
    transformed_data = transform_data(data)
    
    # Save the transformed data
    save_transformed_data(transformed_data, output_file)