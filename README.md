LEDOV
==========
The large-scale eye-tracking database called LEDOV for video salinecy. Database from Lai Jiang, Mai Xu in Beihang University(2016). 

## Brief introduction
LEDOV includes **538 videos** with diverse content, containing a total of **179,336 frames** and **6,431 seconds**. The diverse content refers to the daily action, sports, social activity and art performance of human, and the videos of animal and man-man objects are also included. All videos are at least 720p resolution and 24 Hz frame rate. Then, for monitoring the binocular eye movements, a Tobii TX300 eye tracker  was used in our experiment. Moreover, **32 participants** (18 males and 14 females), aging from 20 to 56 (32 on average), were recruited to participate in the eye-tracking experiment. All participants were non-experts for the eye-tracking experiment, with normal/corrected-to-normal vision. During the experiment, the distance between subjects and the monitor was fixed at 65 cm. Before viewing videos, each subject was required to perform a 9-point calibration for the eye tracker. Afterwards, the subjects were asked to free-view videos displayed at random order. Finally, 5,058,178 fixations of all 32 subjects on 538 videos were collected for our eye-tracking database.

For the **establishment details** and **data analysis** of LEDOV, please refer to Section 3 of our [paper](http://openaccess.thecvf.com/content_ECCV_2018/html/Lai_Jiang_DeepVS_A_Deep_ECCV_2018_paper.html).

Some examples of LEDOV are shown below and in **'sample.avi'**.
![examples](/figs/data.png "examples")

## Download  
All 538 videos as well as eye-tracking can be downloaded at [Dropbox](https://www.dropbox.com/s/pc8symd9i3cky1q/LEDOV.zip?dl=0) and [BaiduYun](http://pan.baidu.com/s/1pLmfjCZ)

## How to use  
* **'VideoInfo.xlsx'** and **'SubjectInfo.xlsx'** list the information of videos and subjects.  
* **'VideoInfo.mat'** also includes the video information in the order of video name, frame rate, frame number, and resolution.  
*  **'Data.mat'** in each sub-fold record the fixations of the video. In **Data.fixdata**, each row refers to a recorded fixation with the information as follows,   
*'column 1'*: the index of subject that the fixation belongs to  
*'column 2'*: the timestamp(ms) that the fixation starts  
*'column 3'*: the duration of the fixation  
*'column 4-5'*: the position of the fixation (take upper-lift corner as the origin)

As a test, you can run **'demo.m'** to generate the heat-map series of the target video.  

## Citation
You are welcome to freely use this database, and please cite with the following Bibtex code:

```
@InProceedings{Jiang_2018_ECCV,
author = {Jiang, Lai and Xu, Mai and Liu, Tie and Qiao, Minglang and Wang, Zulin},
title = {DeepVS: A Deep Learning Based Video Saliency Prediction Approach},
booktitle = {The European Conference on Computer Vision (ECCV)},
month = {September},
year = {2018}
} 
```

## Contact
Should you have any queries, please contact jianglai.china@buaa.edu.cn / jianglai.china@aliyun.com
