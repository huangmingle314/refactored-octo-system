args = commandArgs(trailingOnly=TRUE)

if (length(args)!=2) {
  stop("Rscript drug_predict_package.R drug input_csv ")
} else if (length(args)==2) {
  drug<-arg[1]
  input_csv<-arg[2]
  # drug<-'Cisplatin'
  # input_csv<-'example.Cisplatin.csv'
  # Rscript drug_prediction_score.R Cisplatin example.Cisplatin.csv
  #load naive bayes
  load(paste0('./Naive_Bayes_',drug,'.rdata'))
  Naive_Bayes <- Naive_Bayes_Model
  #load svm
  load(paste0('./SVM_',drug,'.rdata'))
  SVM <- Naive_Bayes_Model
  #load data
  xy.train <- read.csv(input_csv,row.names = 1)
  #predict
  NB_Predictions=predict(Naive_Bayes,xy.train,type = "raw")[,2]
  SVM_Predictions=predict(SVM,xy.train,probability = T)
  SVM_Predictions <- attr(SVM_Predictions, "probabilities")[,'1']  
  #output
  output <- cbind(row.names(xy.train),NB_Predictions,SVM_Predictions)
  output <- as.data.frame(output)
  # output$PredictionScore 
  output$PredictionScore <- apply(output, 1, function(x){
    x <- as.numeric(x)
    return(mean(x[2:3]))
  }
  )
  colnames(output)[1] <- 'sample'
  write.csv(output,file = paste(drug,'prediction.rev.csv',sep = '.'),quote = F,row.names = F)
  ###
} 
