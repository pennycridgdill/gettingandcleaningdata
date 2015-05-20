# GettingAndCleaningData
##Course Project Repository
This is the README file for my repository for the Course Project Getting and Cleaning Data

##Script Breakdown
My run_analysis.r script works using the following basic steps:

1. Read in the feature names (from features.txt), so that I can set those to the column names for the X_data

2. Read in the data from the X_test data, assigning the column names using the features vector

3. Read in the y_test data and the activity_labels table, and then assigng the activity integer values to their associated strings

4. Read in the subject data

5. Do a [grep search](https://stat.ethz.ch/R-manual/R-devel/library/base/html/grep.html) in the feature names for "mean" and "std", combine and sort the resulting vectors

6. Bind the X, y and subject dataframes, and use the sorted vector from the previous step to subset the data to only include the desired measurements

7. Bind a DataType column to the front of the frame, indicated that this data was "Test" data

8. Repeat the Steps above for the training data, omitting redundant steps, such as reading in the feature names and activity labels

9. Row bind the test and training tables

10. Use the aggregate function to aggregate the measurement columns by Subject and Activity (*please* read the [documentation for aggregate](https://stat.ethz.ch/R-manual/R-patched/library/stats/html/aggregate.html) if you do not know how this works with formulae)

11. Arrange the table that resulted from the step above, by subject, and drop the DataType column (since that wasn't part of the requested data)

12. Write the resulting data/table to a text file


##CodeBook
Note: The CodeBook is included in a separate file within this repository







