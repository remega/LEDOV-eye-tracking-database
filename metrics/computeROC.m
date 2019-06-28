function [auc] = computeROC(SM,x,y,verbose);

%
% function [auc] = computeROC(SM,x,y,verbose);
%
% compute ROC for saliency map prediction
% (for Moran's project)
% 
% SM: saliency map - integer values between 0 and 255, y,x
% x: fixations x coordinates
% y: fixations y coordinates
% verbose: draw roc 0/1 (default: 1)
%
% (C) Wolfgang Einhaeuser Treyer 
% Swiss Federal Institute of Technology

if nargin < 3
  error('usage: computeROC(SM,x,y)');
end

if nargin < 4
  verbose = 1;
end

if length(x)~=length(y)
  error('x and y must have the same length');
end

if size(size(SM))~=2
  error('SM must be 2D');
end

badIdx = find(~isfinite(x)|~isfinite(y));
if ~isempty(badIdx)
  warning('x and y contain NaNs - ignored');
  x(badIdx) = [];
  y(badIdx) = [];
end

sX = size(SM,2);
sY = size(SM,1);

x = round(x);
y = round(y);

if (any(x<1)|any(y<1)|any(x>sX)|any(y>sY))
  error('fixation coordinates need to be scaled relative to the saliency map');
end

if (max(SM(:))>255)|(min(SM(:))<0)|(any(round(SM(:))~=SM(:)))
  error('SM must contain integers between 0 and 255');
end


% saliency at fixations
SatFix = nan(1,length(x));
indFix = sub2ind([sY,sX],y,x);
SatFix = SM(indFix);

hits = nan(1,257);
fa   = nan(1,257);

for t = -1 : 256
	
  fa(t+2)    = length(find(SM>=t))/prod(size(SM));
  hits(t+2)  = length(find(SatFix>=t))/length(SatFix);
  
	  
end
AUC1 = sum(diff(fliplr(fa)).*fliplr([hits(2:end)]));
AUC2 = sum(diff(fliplr(fa)).*fliplr([hits(1:end-1)]));
auc = (AUC1+AUC2)/2;

if verbose
  plot(fa,hits,'.-');
   xlabel('false alarms');
   ylabel('hits');
end
