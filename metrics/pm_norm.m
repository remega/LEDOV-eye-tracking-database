

function map_new=pm_norm(map)
	tempmin=min(map(:));
	temp2=map-tempmin;
	map_new=temp2./max(temp2(:));
end