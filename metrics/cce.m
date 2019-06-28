function score = cce(saliencyMap1, saliencyMap2)
% saliencyMap1 and saliencyMap2 are 2 real-valued matrices
if sum(size(saliencyMap1)) ~= sum(size(saliencyMap2))
saliencyMap1 = imresize(saliencyMap1, size(saliencyMap2));

end
map1 = im2double(saliencyMap1);
map2 = im2double(saliencyMap2);
% normalize both maps
map1 = (map1 - mean(map1(:))) / std(map1(:));
map2 = (map2 - mean(map2(:))) / std(map2(:));
score = corr2(map2, map1);

