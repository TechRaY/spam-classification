### Spam Classification

This project classified mail whether it spam or not spam. SVM has been used to classify the mails. cvx and libSVM package have been used. The packages are a part of repository. The code is in matlab. There are scripts using two kernels, one linear and one gaussian. 


### Dataset
Data is a subset of 2005 TREC Public Spam Corpus. It contains a training set and a test set. Both files use the same format: each line represents the space-delimited properties of an email, with the first one being the email ID, the second one being whether it is a spam or ham (non-spam), and the rest are words and their occurrence numbers in this email. The dataset presented to you is processed version of the original dataset where non-word characters have been removed and some basic feature selection has been done.

### Usage
1. Run `transform_data.py`. It parses the dataset and produces two files , one with features and one with classifcation of mail.
2. Use the script in this way : `python transform_data.py <no. of lines on train data> <path to train file> <no. of lines in test data file> <path to test data file>
3. Setup cvx into matlab or octave. Follow the instructions given in cvx package.
4. Run the script to get the accuracy as output. More features can be added to dataset by changing the python script.
5. To use the libSVm , setup it up using the instructionsin libSVM package.
6. Run the matlab script to get the accuracy.
