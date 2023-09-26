# Overview
The code sets up and trains an LSTM (Long Short-Term Memory) neural network model using the TensorFlow and Keras libraries to predict the next 'cluster' based on sequences of previous clusters. The initial steps involve importing necessary libraries and mounting the Google Drive to the Colab environment. Then, it reads the training data from a file named 'FixedTrainData.csv'.The LSTM model consists of an LSTM layer with 100 units and an output dense layer with 6 neurons (corresponding to the 6 different cluster categories). The model uses the 'softmax' activation function for multi-class classification and is compiled with the categorical cross-entropy loss function and the 'adam' optimizer.For training and validation, the code performs a method similar to leave-one-out cross-validation by unique 'speaker_id'. That is, it iteratively excludes data from one speaker for testing and uses the data from all other speakers for training. For each unique speaker, the sequences are reshaped to match the input requirements of the LSTM and the targets are one-hot encoded to match the output structure. The LSTM model is trained on this data using a batch size of 64 for 10 epochs.After training, the model's accuracy is evaluated on the test data and displayed. Additionally, predictions made by the model on the test data are saved along with the actual values, input sequence, segment id, and speaker id to individual CSV files on Google Drive (with filenames structured as 'FixedLSTMPredictions{speaker_id}.csv').This loop continues until predictions have been made for each unique speaker, thus providing a speaker-specific accuracy measurement and saved prediction file for each one.

# LSTM Run Instructions
1)Before opening Colab, navigate to your Google Drive.

2)Create a new folder (e.g., "LSTM_Project") to store the predictions the LSTM makes.

3)Make sure the training data is downloaded.

4)Run the cells.

