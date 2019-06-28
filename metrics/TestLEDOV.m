
function res = TestLEDOV(saldir)

load('./LEDOV/VideoNameList.mat','VideoNameList')
load('./LEDOV/namelist.mat','testlist','trainlist','vaildlist')
videoDir='./LEDOV';
countvid=0;
for m=testlist'
    tic
	InputVideoName_short=VideoNameList{m};
	InputVideoName=[InputVideoName_short '.mp4'];
	load([videoDir '/' InputVideoName_short '/Data.mat'],'Data')
countvid=countvid+1;
num_frames=Data.VideoFrames;
frames_rate=Data.VideoFrameRate;
video_size=Data.VideoSize;
width=video_size(1);
height=video_size(2);
video_fixation=Data.fixdata;

fixationPerFrame=cell(1,num_frames);
frame_durationMs=1000/frames_rate;

centermask=round(height/20);
beginflag=1;

for k=1:size(video_fixation,1)
    k;
	if k==1
		beginflag=1;
	elseif video_fixation(k,2)<video_fixation(k-1,2)
		beginflag=1;
	end
	
	vx=video_fixation(k,4);
	vy=video_fixation(k,5);
	if beginflag
		if (vx>(width/2+centermask)||vx<(width/2-centermask))&&(vy>(height/2+centermask)||vy<(height/2-centermask))&&(vx>0&&vx<width)&&(vy>0&&vy<height)
			fixPosition=[video_fixation(k,4);video_fixation(k,5)];
			beginflag=0;
		else
			continue
		end
	end
	
	if(vx>0&&vx<width)&&(vy>0&&vy<height)
		fixPosition=[video_fixation(k,4);video_fixation(k,5)];
	else
		continue
	end
	startFrame=ceil(video_fixation(k,2)/frame_durationMs);
    endFrame=ceil((video_fixation(k,2)+video_fixation(k,3))/frame_durationMs);
    if(startFrame==0)
		startFrame=1;
    end
    if(endFrame>num_frames)
        endFrame=num_frames;
    end
    for i=startFrame:endFrame
        fixationPerFrame{i}=[fixationPerFrame{i} fixPosition];
    end
end

Auc=[];
nss=[];
coc=[];
KL=[];

countvaild=0;
try
obj=VideoReader([saldir '/' InputVideoName_short '.avi']);
catch
    obj=VideoReader([saldir '/' InputVideoName_short '_result.avi']);
end
vidFrames=read(obj);
color_map=colormap(jet(256));
 for k=1:size(vidFrames,4)

	tempframe=double(vidFrames(:,:,1,k));
    if isempty(fixationPerFrame{k})
		continue
	else
		countvaild=countvaild+1;
	end
	x=fixationPerFrame{k}(1,:);
    y=fixationPerFrame{k}(2,:);
	saliencymap = imresize(tempframe,[height, width]);
	saliencymap = imfilter(saliencymap, fspecial('gaussian', round(height/7.5), round(height/30)));	

   saliencymap=pm_norm(saliencymap);
   saliencymap(isnan(saliencymap))=0;
   fixationmap=zeros(height, width);
	for j=1:length(x)
		if y(j)>0&&x(j)>0
		fixationmap(y(j),x(j))=1;
		end
	end
    fix_gaussian= make_gauss_masks4(x,y,[height width],100);
   	Auc(countvaild,1)=computeROC(uint8(round(saliencymap*255)),x,y,0);	
	nss(countvaild,1)=NSS(saliencymap,fixationmap);
	coc(countvaild,1)=cce(saliencymap,fix_gaussian);			
	KL(countvaild,1) = kl_divergence(saliencymap, fix_gaussian);

 end

 
vidFrames=[];

meanauc(countvid,:)=mean(Auc);
meannss(countvid,:)=mean(nss);
meancoc(countvid,:)=mean(coc);
meanKL(countvid,:)=mean(KL);
stdauc(countvid,:)=std(Auc);
stdnss(countvid,:)=std(nss);
stdcoc(countvid,:)=std(coc);
stdKL(countvid,:)=std(KL);	   	   
m
toc
end

res=[meanauc meannss meancoc meanKL stdauc stdnss stdcoc stdKL];







end