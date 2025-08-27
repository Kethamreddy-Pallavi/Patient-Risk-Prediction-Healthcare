# Step 1: Create a Spark session for running Spark operations
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("Patient Risk Prediction").getOrCreate()

# Step 2: Define the path to the CSV file and load it into a Spark DataFrame
csv_path = "/FileStore/tables/updated_patient_data.csv"
df = spark.read.csv(csv_path, header=True, inferSchema=True)  # Read CSV with headers and infer data types
df.show()  # Display the first few rows of the DataFrame

# Step 3: Prepare the data for machine learning by assembling features
from pyspark.ml.feature import VectorAssembler
assembler = VectorAssembler(inputCols=["age"], outputCol="features")  # Use 'age' as input feature
data = assembler.transform(df)  # Add a new column 'features' with vectorized age values

# Step 4: Split the data into training and testing sets (70% train, 30% test)
train_data, test_data = data.randomSplit([0.7, 0.3], seed=42)

# Step 5: Initialize and train a logistic regression model
from pyspark.ml.classification import LogisticRegression
lr = LogisticRegression(labelCol="risk_label", featuresCol="features")  # Define label and feature columns
model = lr.fit(train_data)  # Train the model using training data

# Step 6: Make predictions on the test data
predictions = model.transform(test_data)  # Apply the model to test data
predictions.select("patient_id", "age", "risk_label", "prediction", "probability").show()  # Show results

# Step 7: Evaluate the model's performance using Binary Classification Evaluator
from pyspark.ml.evaluation import BinaryClassificationEvaluator
evaluator = BinaryClassificationEvaluator(labelCol="risk_label")  # Define evaluator with label column
accuracy = evaluator.evaluate(predictions)  # Calculate accuracy score
print(f"Model Accuracy: {accuracy}")  # Print the accuracy

# Step 8: Save the predictions to a CSV file in DBFS
predictions.select("patient_id", "age", "risk_label", "prediction") \
    .write.csv("/FileStore/tables/patient_risk_predictions.csv", header=True, mode="overwrite")
