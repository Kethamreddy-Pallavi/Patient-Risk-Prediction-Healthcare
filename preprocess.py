
import pandas as pd

def preprocess_data(filepath):
    df = pd.read_csv(filepath)
    df['age_group'] = pd.cut(df['age'], bins=[0, 40, 60, 100], labels=['Young', 'Middle-aged', 'Senior'])
    df = pd.get_dummies(df, columns=['gender', 'age_group'])
    return df

if __name__ == "__main__":
    processed_df = preprocess_data('../data/patient_data.csv')
    processed_df.to_csv('../data/processed_patient_data.csv', index=False)
