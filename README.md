# Drug prediction score function
## Step1 prepare
You should prepare the gene expression matrix in csv format with gene as column, sample in row.
## Step2 run
Prediction score code is a Rscript  
You can download the folder 'drug_predict_package' and  run the code in terminal as follow:  
### for Cisplatin drug prediction  
```Rscript drug_prediction_score.R Cisplatin example.Cisplatin.csv ```  
### for 5Fu drug prediction  
```Rscript drug_prediction_score.R 5FU example.5FU.csv ```  
## Step3 result
The prediction scores of each sample show in the last column as 'PredictionScore'.  
The numeric range of the prediction score is 0-1. The higher the predictive score, the more resistant to the drug.



