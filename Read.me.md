

                                   ***Patient Risk Prediction – Healthcare***



 **Project Overview :**



This project aims to predict patient risk levels based on demographic and hospital data. It uses a star schema database design and visual analytics to support healthcare decision-making.



 **Technologies Used :**

\- Apache Spark \& MLlib (for scalable machine learning)

\- PostgreSQL (for relational data storage)

\- Python (Pandas, Plotly for visualization)



&nbsp;**Database Schema :**



The database consists of one fact table and three dimension tables:



fact\_patient\_risk: Contains patient risk predictions.

dim\_patient: Stores patient demographic data.

dim\_hospital: Contains hospital information.

dim\_diagnosis: Lists diagnosis and disease types.



 **Visualizations :**



Visual insights generated from the data:



1\. \*\*Risk Label Distribution\*\*

&nbsp;  !\[Risk Label Distribution](images/risk\_label\_distribution.png)



2\. \*\*Age vs. Risk Label by Source\*\*

&nbsp;  !\[Age vs. Risk Label](images/age\_vs\_risk\_label.png)



3\. \*\*Patient Count per Hospital\*\*

&nbsp;  !\[Hospital-wise Patient Count](images/hospital\_patient\_count.png)



 **How to Use:** 



1\. Clone the repository:

&nbsp;  ```bash

&nbsp;  git clone Patient-Risk-Prediction-Healthcare/patient_risk_schema.sql at main · Kethamreddy-Pallavi/Patient-Risk-Prediction-Healthcare
 

&nbsp;  ```

2\. Set up the database using `schema.sql`.

3\. Run analysis scripts or notebooks to generate insights.



 **File Structure :**

```

├── schema.sql

├── README.md

├── images/

│   ├── risk\_label\_distribution.png

│   ├── age\_vs\_risk\_label.png

│   └── hospital\_patient\_count.png

```


