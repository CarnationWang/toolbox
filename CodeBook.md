I followed the following steps shared by Shyamala Jyoti and the meaning of the variables are shown:

* Read files X_test,X_train.y_test,y_train,Subject_test,Subject_train,features and activity_lables text files into dataframes.

* Column bind Dataframes y_test and subject_test and add column names Activity and Subject to it. ->A

* Column bind Dataframes y_train and subject_train and add column names Activity and Subject to it. ->B

* Merge A and B (dim-10299*2) ->C

* Merge X_train and X_test data -> D (dim-10299*561)

* Change column names of D from features.txt

* Eliminate columns from D which do not have "mean()" or "std()" in the column names. ->E (dim-10299*66)

* Column bind C and E (dim-10299*68)

* Take mean of observations per activity per subject. (dim-180*68). 

* Replace activity numbers with Activity names from activity_lables.txt-> Final Table

* Use write.table to get a text file from the above Data Frame.Submit this text file for Question 1 of Assessment
