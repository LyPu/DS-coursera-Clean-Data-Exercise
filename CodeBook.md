This codebook is for a course project of Getting and Cleaning Data from Coursera. The goal for this project is to clean up the human activity recognition using smartphones data and create a tidy dataset for later analysis by following below 5 steps.

Step 1:
(1). Download the dataset under the folder UCI_HAR_Dataset and read all data files;
  1).features: from features.txt, containing 561 rows and 2 columns
  2).activities:from activity_labels.txt, containing 6 rows and 2 columns
  3).subjecties: from subject_train.txt (7352 rows and 1 columns) and subject_test.txt (2947 rows and 1 columns)
  4).X: from X_train.txt (7352 rows and 561 columns) and X_test.txt (2947 rows and 561 columns)
  5).Y: from Y_train.txt(7352 rows and 1 columns) and Y_test.txt (7352 rows and 1 columns)
(2). Merge X, Y and Subject to create one dataset

Step 2: extract those columns containing mean and std (also keep code and subject for further use)

Step 3: add an activity column to the dataset by using activity column in activities 

Step 4: standardize column names
 (1) rename "Acc" to "Acceleration"
 (2) rename "t" in the beginning to "Time"
 (3) rename "f" in the beginning to to "Frequency"
 (4) rename "BodyBody" to "Body"
 (5) rename "mean" to "Mean"
 (6) rename "std" to "Std"
 (7) rename "Freq" to "Frequency"
 (8) rename "Mag" to "Magnitude"
 
Step 5: aggregate each variables within subject and activity and create the final output



