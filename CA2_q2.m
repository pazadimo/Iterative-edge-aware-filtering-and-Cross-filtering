iteration = 5;


image=imread('carpet_01_noflash.png');
image_noflash=im2double(image);
image22=imread('carpet_00_flash.png');
image_flash=im2double(image22);
image33=imread('carpet_03_our_result.jpg');
image_their=im2double(image33);

W=40;
lambda=35;
[h_horizon1,h_vertical1]= FilterGen(image_flash,W);
[image1_horizon, image1_vertical, image2, image5, image_out1]=ApplySpatialFilter(image_noflash,h_horizon1,h_vertical1, lambda,W, iteration);

%subplot(1,2,1)
figure,imshow(image_out1);
title("Filtered By Filter From Flashed Image")
[h_horizon2,h_vertical2]= FilterGen(image_noflash,W);
[image1_horizon, image1_vertical, image2, image5, image_out2]=ApplySpatialFilter(image_noflash,h_horizon2,h_vertical2, lambda,W, iteration);
%subplot(1,2,2)
figure,imshow(image_out2);
title("Filtered By Filter From No-Flashed Image")

%subplot(1,3,3)
figure,imshow(image_their)
title("Their Result")
%%
%%%%%%%%%

iteration = 5;


image=imread('cave01_01_noflash.jpg');
image_noflash=im2double(image);
image22=imread('cave01_00_flash.jpg');
image_flash=im2double(image22);
image33=imread('cave01_03_our_result.jpg');
image_their=im2double(image33);

W=9;
lambda=5;
[h_horizon1,h_vertical1]= FilterGen(image_flash,W);
[image1_horizon, image1_vertical, image2, image5, image_out]=ApplySpatialFilter(image_noflash,h_horizon1,h_vertical1, lambda,W, iteration);

%subplot(1,2,1)
figure,imshow(image_out);
title("Filtered By Filter From Flashed Image")
[h_horizon2,h_vertical2]= FilterGen(image_noflash,W);
[image1_horizon, image1_vertical, image2, image5, image_out]=ApplySpatialFilter(image_noflash,h_horizon2,h_vertical2, lambda,W, iteration);
%subplot(1,2,2)
figure,imshow(image_out);
title("Filtered By Filter From No-Flashed Image")

%subplot(1,3,3)
figure,imshow(image_their)
title("Their Result")
%%%%%%%%%%
%%
iteration = 5;


image=imread('lamp_01_noflash.jpg');
image_noflash=im2double(image);
image22=imread('lamp_00_flash.jpg');
image_flash=im2double(image22);
image33=imread('lamp_03_our_result.jpg');
image_their=im2double(image33);

W=2;
lambda=1;
[h_horizon1,h_vertical1]= FilterGen(image_flash,W);
[image1_horizon, image1_vertical, image2, image5, image_out1]=ApplySpatialFilter(image_noflash,h_horizon1,h_vertical1, lambda,W, iteration);

%subplot(1,2,1)
figure,imshow(image_out1);
title("Filtered By Filter From Flashed Image")
[h_horizon2,h_vertical2]= FilterGen(image_noflash,W);
[image1_horizon, image1_vertical, image2, image5, image_out2]=ApplySpatialFilter(image_noflash,h_horizon2,h_vertical2, lambda,W, iteration);
%subplot(1,2,2)
figure,imshow(image_out2);
title("Filtered By Filter From No-Flashed Image")

%subplot(1,3,3)
figure,imshow(image_their)
title("Their Result")
%%%%%%%%%%


%%%%%%%%%%



%%
%%%%%%%%%
iteration = 5;


image=imread('potsdetail_01_noflash.jpg');
image_noflash=im2double(image);
image22=imread('potsdetail_00_flash.jpg');
image_flash=im2double(image22);
image33=imread('potsdetail_03_our_result.jpg');
image_their=im2double(image33);

W=2;
lambda=1.5;
[h_horizon1,h_vertical1]= FilterGen(image_flash,W);
[image1_horizon, image1_vertical, image2, image5, image_out1]=ApplySpatialFilter(image_noflash,h_horizon1,h_vertical1, lambda,W, iteration);

%subplot(1,2,1)
figure,imshow(image_out1);
title("Filtered By Filter From Flashed Image")
[h_horizon2,h_vertical2]= FilterGen(image_noflash,W);
[image1_horizon, image1_vertical, image2, image5, image_out2]=ApplySpatialFilter(image_noflash,h_horizon2,h_vertical2, lambda,W, iteration);
%subplot(1,2,2)
figure,imshow(image_out2);
title("Filtered By Filter From No-Flashed Image")

%subplot(1,3,3)
figure,imshow(image_their)
title("Their Result")
%%
iteration = 5;


image=imread('puppets_01_noflash.jpg');
image_noflash=im2double(image);
image22=imread('puppets_00_flash.jpg');
image_flash=im2double(image22);
image33=imread('puppets_03_our_result.jpg');
image_their=im2double(image33);

W=50;
lambda=40;
[h_horizon1,h_vertical1]= FilterGen(image_flash,W);
[image1_horizon, image1_vertical, image2, image5, image_out1]=ApplySpatialFilter(image_noflash,h_horizon1,h_vertical1, lambda,W, iteration);

%subplot(1,2,1)
figure,imshow(image_out1);
title("Filtered By Filter From Flashed Image")
[h_horizon2,h_vertical2]= FilterGen(image_noflash,W);
[image1_horizon, image1_vertical, image2, image5, image_out2]=ApplySpatialFilter(image_noflash,h_horizon2,h_vertical2, lambda,W, iteration);
%subplot(1,2,2)
figure,imshow(image_out2);
title("Filtered By Filter From No-Flashed Image")

%subplot(1,3,3)
figure,imshow(image_their)
title("Their Result")
%%
iteration = 5;


image=imread('PuriaLow.png');
image_noflash=im2double(image);
image22=imread('EdgePuria.png');;
image_flash=im2double(image22);

W=1;
lambda=1;
[h_horizon1,h_vertical1]= FilterGen(image_noflash,W);
[image1_horizon, image1_vertical, image2, image5, image_out]=ApplySpatialFilter(image_flash,h_horizon1,h_vertical1, lambda,W, iteration);

%subplot(1,2,1)
figure,imshow(image_out);
title("High-Pass Image Filtered By Filter From Low-Pass Image")
[h_horizon2,h_vertical2]= FilterGen(image_flash,W);
[image1_horizon, image1_vertical, image2, image5, image_out]=ApplySpatialFilter(image_noflash,h_horizon2,h_vertical2, lambda,W, iteration);
%subplot(1,2,2)
figure,imshow(image_out);
title("Low-Pass Image Filtered By Filter From High-Pass Image")