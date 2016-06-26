# Assignment cleaning data
12 June 2016, Pieter ten Have


## Explanation how the data cleaning is done.


First I made a selection of the features containing the word "mean" or "std"

Then I created a train dataset by selecting the variable columns (x) with the keep-feature list,
 and adding the list of subjects (id's) and the column with target values (y).
 I called this file "train".

Then I created a test dataset in the same way calling this file "test".

Then I merged the train and the test dataset and called this file "total.csv".

Finally I averaged the column values by subject and called this file "avg_person.csv".
