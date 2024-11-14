import pandas as pd

# Load the data (modify the file name as needed)
data = pd.read_csv("made.tsv", sep='\t')

# Initialize an empty DataFrame to store the filtered data
filtered_data = pd.DataFrame()

# Process each column individually
for col in data.columns:
    # Calculate Q1, Q3, and IQR for the column
    Q1 = data[col].quantile(0.25)
    Q3 = data[col].quantile(0.75)
    IQR = Q3 - Q1
    
    # Define outlier boundaries
    lower_bound = Q1 - 1.5 * IQR
    upper_bound = Q3 + 1.5 * IQR
    
    # Filter out outliers
    filtered_col = data[(data[col] >= lower_bound) & (data[col] <= upper_bound)][col]
    
    # Add filtered column to the DataFrame
    filtered_data[col] = filtered_col

# Save the filtered data to a new TSV file
filtered_data.to_csv("made_filtered.tsv", sep='\t', index=False)

# Repeat the same process for 'traditional.tsv' file
data = pd.read_csv("traditional.tsv", sep='\t')
filtered_data = pd.DataFrame()

for col in data.columns:
    Q1 = data[col].quantile(0.25)
    Q3 = data[col].quantile(0.75)
    IQR = Q3 - Q1
    lower_bound = Q1 - 1.5 * IQR
    upper_bound = Q3 + 1.5 * IQR
    filtered_col = data[(data[col] >= lower_bound) & (data[col] <= upper_bound)][col]
    filtered_data[col] = filtered_col

filtered_data.to_csv("traditional_filtered.tsv", sep='\t', index=False)

