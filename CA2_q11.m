iteration = 5;


image2=imread('EdgePuria.png');
image=im2double(image2);
W=10;
lambda=1;
[h_horizon,h_vertical]= FilterGen(image,W);
[image1_horizon, image1_vertical, image2, image5, image_out]=ApplySpatialFilter(image,h_horizon,h_vertical, lambda,W, iteration);
figure,imshow(image_out);
title("After the Fifth Iteration ")
figure,imshow(image2);
title("After the Second Iteration")
% figure,imshow(image1_horizon);
% title("After the First Horizontally Filtering")
% figure,imshow(image1_vertical);
% title("After the First Vertially Filtering")
%%
%%%%%%%%%
image2=imread('PuriaLow.png');
image=im2double(image2);

W=10;
lambda=1;
[h_horizon,h_vertical]= FilterGen(image,W);
[image1_horizon, image1_vertical, image2, image5, image_out]=ApplySpatialFilter(image,h_horizon,h_vertical, lambda,W, iteration);
figure,imshow(image_out);
title("After the Fifth Iteration")
figure,imshow(image2);
title("After the Second Iteration")
% figure,imshow(image1_horizon);
% title("After the First Horizontally Filtering")
% figure,imshow(image1_vertical);
% title("After the First Vertially Filtering")
%%

image2=imread('EdgePuria.png');
LPF(image2,5,15)
title("After Guassion Filtering")
image2=imread('PuriaLow.png');
LPF(image2,7,15)
title("After Guassion Filtering")


