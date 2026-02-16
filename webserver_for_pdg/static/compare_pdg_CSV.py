import pandas as pd

"""
These two CSV files are similar but

the index in the first column is not the same
and

one of the files has additional content

Write a Python script that reads both files and alters the index in the file that is missing content, then writes that to a third output file.
The purpose of this script is to enable side-by-side comparison of the file with additional content to the third file.
"""

def align_csv_files(base_file, expanded_file, output_file):
    print(f"Reading {expanded_file} (Reference struct)...")
    # Read the file with additional content to serve as the structural template
    df_expanded = pd.read_csv(expanded_file)
    
    print(f"Reading {base_file} (Source data)...")
    # Read the file that is missing content
    df_base = pd.read_csv(base_file)

    # Use the 'id' column to match records.
    # We want to keep the order/structure of df_expanded, 
    # but only pull data that exists in df_base.
    
    print("Store the original column names from the base file")
    base_columns = df_base.columns.tolist()
    
    print("remove the index column from base to prevent naming conflicts as we will be using the index from the expanded file.")
    if '_id:id' in df_base.columns:
        df_base = df_base.drop(columns=['_id:id'])

    print("Create a template using only the ID and the new Index from the expanded file")
    template = df_expanded[['_id:id', 'id']].copy()

    print("Merge the base data into the template based on the 'id' string")
    # This places the base content at the 'index' positions defined by the expanded file
    aligned_df = pd.merge(template, df_base, on='id', how='left')

    print("Restore the column order (placing the new index back at the start)")
    # Re-fill the index column to match the expanded file's integers
    aligned_df['_id:id'] = df_expanded['_id:id']
    
    print("Ensure the output has the same columns as the base file (in the correct order) but with the new aligned data")
    final_columns = ['_id:id'] + [col for col in base_columns if col != '_id:id']
    aligned_df = aligned_df.reindex(columns=final_columns)

    print(f"Writing aligned data to {output_file}...")
    aligned_df.to_csv(output_file, index=False)
    print("Done. Files are now ready for side-by-side comparison.")

# Execution
if __name__ == "__main__":
    align_csv_files('pdg.csv', 'pdg_HAS_SYMBOL.csv', 'pdg_aligned.csv')