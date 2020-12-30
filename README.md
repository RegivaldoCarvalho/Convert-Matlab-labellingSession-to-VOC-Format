# Convert-Matlab-labellingSession-to-VOC-Format
Convert a labellingSession from Matlab to a VOC dataset in an XML format

We are using the function struct2xml version 1.7.0.0 (3 KB) by Wouter Falkena.
https://www.mathworks.com/matlabcentral/fileexchange/28639-struct2xml?s_tid=srchtitle

Matlab2VOC.m has been modifed to work with the newer ground truth labeler.
Export the variable name as gTruth, export format as groundTruth.

# How to do 

The entire process is too simple and only need three steps.

## Step 1
Put in the same folder the files below:

```bash
- Matlab2VOC.m
- struct2xml.m
```
## Step 2

On Matlab editor open the script Matlab2VOC.m and set the path to you ground truth labeling session, like the example below: 

```bash
% Load ground truth from labeling session
% It is assumed the file is called gTruth
load('C:\Users\Andy\OneDrive\Desktop\Coding\Matlab\Labelling\cat.mat')
```

## Step 3

The XML files are generated in the same folder as the image folder. 

