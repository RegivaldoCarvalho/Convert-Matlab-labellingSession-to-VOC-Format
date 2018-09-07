# Convert-Matlab-labellingSession-to-VOC-Format
Convert a labellingSession from Matlab to a VOC dataset in an XML format

We are using the function struct2xml version 1.7.0.0 (3 KB) by Wouter Falkena.
https://www.mathworks.com/matlabcentral/fileexchange/28639-struct2xml?s_tid=srchtitle

# How to do 

The entire process is too simple and only need three steps.

## Step 1
Put in the same folder the files below:

```bash
- Matlab2VOC.m
- struct2xml.m
```
## Step 2

On Matlab editor open the script Matlab2VOC.m and set the path to you labellingSession, like the exemple below: 

```bash
% Load labelingSesssion
load('D:\Python\Power_Grid_Inspection\labelingSessions\Isolador_Pilar_01_09_2018.mat')
```

## Step 3

Copy the XML files generated to the same folder of your images.

Just that, you are ready to use your new VOC dataset. 

Thank you, for your attention. 

