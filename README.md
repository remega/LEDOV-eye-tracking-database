# LEDOV-eye-tracking-database
The large-scale eye-tracking database called LEDOV for video salinecy


Database from Lai Jiang, Mai Xu in Beihang University(2016). 

This database contains the fixation data of 538 standard video sequences of our proposed eye-tracking database, LEDOV. In the root directory, the information of videos and subjects are listed in 'VideoInfo.xlsx' and 'SubjectInfo.xlsx', respectively. Besides, for programming in Matlab, the names of the videos are also listed in 'VideoNameList.mat', and 'VideoInfo.mat' includes the video information in the order of video name, frame rate, frame number, and resolution.  

The fixation data of each video are recorded in 'Data.mat' in corresponding sub-fold. In each Data.fixdata, each row refers to a recorded fixation with the information as follows, 
'column 1': the index of subject that the fixation belongs to  
'column 2': the timestamp(ms) that the fixation starts  
'column 3': the duration of the fixation  
'column 4-5': the position of the fixation (take upper-lift corner as origin )  

As a test, you can run 'demo.m' to generate the heat-map series of the target video.  

The detail of LEDOV is intrdouced in https://arxiv.org/abs/1709.06316

Please cite with the following Bibtex code:

@InProceedings{Jiang2017predicting,  
author = {Lai Jiang, and Mai Xu, and Zulin Wang},  
title = {Predicting Video Saliency with Object-to-Motion CNN and Two-layer Convolutional LSTM},  
booktitle = {arXiv preprint arXiv:1709.06316},  
month = {Sep.},  
year = {2017}  
}

Should you have any queries, please contact jianglai.china@buaa.edu.cn
