
import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report

# Load processed data
df = pd.read_csv('../data/processed_patient_data.csv')

# Features and target
X = df.drop(columns=['patient_id', 'hospital_id', 'diagnosis_id', 'risk_score'])
y = (df['risk_score'] > 0.7).astype(int)

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train model
model = LogisticRegression()
model.fit(X_train, y_train)

# Evaluate
y_pred = model.predict(X_test)
print(classification_report(y_test, y_pred))
