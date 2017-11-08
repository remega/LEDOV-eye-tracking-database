LEDOV
==========
The large-scale eye-tracking database called LEDOV for video salinecy. Database from Lai Jiang, Mai Xu in Beihang University(2016). 

## Brief introduction
LEDOV includes **538 videos** with diverse content, containing a total of **179,336 frames** and **6,431 seconds**. The diverse content refers to the daily action, sports, social activity and art performance of human, and the videos of animal and man-man objects are also included. All videos are at least 720p resolution and 24 Hz frame rate. Then, for monitoring the binocular eye movements, a Tobii TX300 eye tracker  was used in our experiment. Moreover, **32 participants** (18 males and 14 females), aging from 20 to 56 (32 on average), were recruited to participate in the eye-tracking experiment. All participants were non-experts for the eye-tracking experiment, with normal/corrected-to-normal vision. During the experiment, the distance between subjects and the monitor was fixed at 65 cm. Before viewing videos, each subject was required to perform a 9-point calibration for the eye tracker. Afterwards, the subjects were asked to free-view videos displayed at random order. Finally, 5,058,178 fixations of all 32 subjects on 538 videos were collected for our eye-tracking database.

For the **establishment details** and **data analysis** of LEDOV, please refer to Section 3 of our [paper](https://arxiv.org/abs/1709.06316).

Some examples of LEDOV are shown below and in **sample.avi**.
![examples](/figs/data.png "examples")

## Download  
All 538 videos as well as eye-tracking can be downloaded at Dropbox ([Part1](https://www.dropbox.com/s/xqrae7bc73jnncr/LEDOV.zip.001?dl=0) and [Part2](https://www.dropbox.com/s/pxbahpwkea9icw0/LEDOV.zip.002?dl=0)) and [BaiduYun](http://pan.baidu.com/s/1pLmfjCZ)

## How to use  
* **'VideoInfo.xlsx'** and **'SubjectInfo.xlsx'** list the information of videos and subjects.  
* **'VideoInfo.mat'** also includes the video information in the order of video name, frame rate, frame number, and resolution.  
*  **'Data.mat'** in each sub-fold record the fixations of the video. In **Data.fixdata**, each row refers to a recorded fixation with the information as follows,   
*'column 1'*: the index of subject that the fixation belongs to  
*'column 2'*: the timestamp(ms) that the fixation starts  
*'column 3'*: the duration of the fixation  
*'column 4-5'*: the position of the fixation (take upper-lift corner as the origin)

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
