function score = kl_divergence(saliencyMap, fixationMap)
% saliencyMap is the saliency map
% fixationMap is the human fixation map

map1 = im2double(imresize(saliencyMap, size(fixationMap)));
map2 = im2double(fixationMap);

% make sure map1 and map2 sum to 1
if any(map1(:))
    map1 = map1/sum(map1(:));
end

if any(map2(:))
    map2 = map2/sum(map2(:));
end

% compute KL-divergence
score = sum(sum(map2 .* log(eps + map2./(map1+eps))));
