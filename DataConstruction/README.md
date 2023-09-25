# Overview
The code processes a dataframe of cluster values derived from k-means clustering of time bins into 6 categories, captured in the 'cluster' column. Using a periodically resetting time_bin_id, it constructs sequences from these clusters. Specifically, for each reset sequence, the code aims to generate consecutive sequences of 10 'cluster' values, and for each of these sequences, an 11th 'cluster' value is identified as the prediction target. If a group has more than 11 values, the code iteratively slides over it, taking every set of 10 consecutive values and their subsequent 11th value as the target, until all possible sequence-target combinations are extracted. Groups with fewer than 11 values are excluded.The final output is a dataframe tailored as training data for an LSTM model, where each row presents a sequence, its corresponding target, and the related metadata like seg_id, speaker_id, dataset, and speech_register.

# Data Construction Run Instructions
1)Upload DataConstructionCode.ipynb to your google drive and open it in colabatory and make sure you have clusters6.csv downloaded to your local machine. 

2)Run the first cell and upload the clusters6.csv

3)Run the remaining cells, and save the TrainingData.csv


