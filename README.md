Getting and Cleaning Data: Course Project from Johns Hopkins

Introduction

This repo contains the deliverable for the course project for the class "Getting and Cleaning Data".

For each record it is provided:
======================================

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope. 
A 561-feature vector with time and frequency domain variables. 
Its activity label. 
An identifier of the subject who carried out the experiment.

Data set includes these and more files:
======================================
There are several data file used to complete this project. 
x_test.txt - Training and Test data sets 
y_test.txt - Training and Test Labels
features.txt - List of all features
subject_train.txt -  Each row identifies who perfomr the activity for each window sample. Range is 1 to 30.
activity_labels.txt - Links the class labels with their activity name.

The script "run_analysis.R" was created per the project instructions. The script combines and cleans the data sets to 
to provide the one of the deliverable entitled the "tidy.csv" as subset of the original merged data sets with Mean 
and Standard Deviation information.

Code Book

The Code Book fill is also provided per the project deliverables and it provides explinations on the transfromations
performed during the creation of the tidy.csv file.