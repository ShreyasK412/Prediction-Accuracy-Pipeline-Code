# Overview
The code processes a dataframe of cluster values that follow from a k-means clustering of time bins into 6 distinct categories, represented in the 'cluster' column. The dataframe uses a periodically resetting time_bin_id to organize these clusters. The code extracts sequences of 10 consecutive 'cluster' values leading up to each reset point, and identifies an 11th 'cluster' value as the target for prediction. Along with each sequence-target pair, the code also extracts consistent metadata like seg_id, speaker_id, dataset, and speech_register associated with that sequence. The final output is a new dataframe: each row has a sequence of 10 'cluster' values derived from the original time bins, the corresponding 11th target value, and the associated metadata.If there are more than 11 values in a group, it slides over the list one cluster at a time, producing multiple overlapping sequences with their corresponding targets. Any groups with fewer than 11 values are omitted to ensure the output only contains complete sequences and targets.

# Data Construction Run Instructions
Upload DataConstructionCode.ipynb to your google drive and open it in colabatory and make sure you have clusters6.csv downloaded to your local machine. 

Run each cell

