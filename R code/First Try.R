#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
#                                                        -
#                                                        -
#               Group project                            -
#                                                        -
#                                                        -
#                                                        -
#_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

#Description




install.packages('randomForest')

#libraries
library(ggplot2)
library(tidyverse)
library(dplyr)
library(data.table)
library(tree)
library(randomForest)
#codes

train<-fread('bank_mkt_train.csv')
test<-fread('bank_mkt_test.csv')

train$subscribe
#first model without pre-processing
set.seed(613)
FirstModel=tree(subscribe~.,train)
FP<-predict(FirstModel,test)
FP<-data.frame(FP)
Final<-NULL
Final$client_id<-test%>%select(client_id)
Final$subscribe<-FP%>%select(FP)%>%rename(subscribe=FP)
Final<-data.frame(Final)
fwrite(Final,'first_try.csv')
#end of first model
