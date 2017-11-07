function my_mask= make_gauss_masks4(x,y,my_size,fixsize)
%This function drop Gaussians centered at (x,y) locations. my_size is the
%size of your original image (also the size of the output of this function). 

% Author    : Umesh Rajashekar
% Date      : 4 Jan. 2008


W = 2; %Full width at half max in visual degrees of angle for the Gaussian
W = W*40; %For my experiments, 1 degree of visual angle is 60 pixels

%Convert full width at half max to variance
my_sigma = W/(2*sqrt(2*log(2)));
height=my_size(1);
width=my_size(2);
R = fixsize;C= fixsize;
big_R=2*R+1;big_C= 2*C+1; %Double your gauss size

[X Y] = meshgrid(0:big_C-1,0:big_R-1);
my_mask = zeros(my_size(1),my_size(2));

temp_num = (X-C).^2 + (Y-R).^2;
temp = exp(-temp_num/(2*my_sigma^2));
big_gauss = temp /(2*pi*my_sigma);
big_gauss=big_gauss./max(big_gauss(:));

for i = 1: length(x)
    temp_x = floor(x(i));temp_y = floor(y(i));
    minx=max(1,temp_x-C);
    miny=max(1,temp_y-R);
    maxx=min(width,temp_x+C);
    maxy=min(height,temp_y+R);
    temp = big_gauss(R+1-(temp_y-miny):R+1+(maxy-temp_y ),C+1-(temp_x-minx):C+1+(maxx-temp_x ));
    my_mask(miny:maxy,minx:maxx) = my_mask(miny:maxy,minx:maxx) + temp;   %Weight by time of fixation
end



