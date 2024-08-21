clc;
clear all
close all
inputImage = imread('../data/LENA.TIF');

%First Order
[ll, patch_8,  patch_9, patch_10] = generate_haar_swatches(inputImage);
[llll, patch_5,  patch_6, patch_7] = generate_haar_swatches(ll);
[patch_1,  patch_2,  patch_3,  patch_4] = generate_haar_swatches(llll);


% only 5,6,7,8,9
a = standard_h_recon(patch_1, patch_2, patch_3,  patch_4, zeros(128),  zeros(128), zeros(128),   zeros(256), zeros(256), patch_10);
figure1_a = figure;
imshow(cast_int(a))
error_a = my_mse(a,cast_double(inputImage))
title(['Image Reconstruction B ; Error =', num2str(error_a)]);


figure1_B = figure;
% only 2,3,4,5,6 
B = standard_h_recon(patch_1,zeros(64),zeros(64),zeros(64),  zeros(128),  zeros(128), patch_7,   patch_8,  patch_9,patch_10);
error_B = my_mse(B,cast_double(inputImage))
imshow(cast_int(B))
title(['Image Reconstruction B ; Error =', num2str(error_B)]);



figure1_C = figure;
% only 2,3,4,5,6 

C = standard_h_recon(patch_1, patch_2, patch_3,  patch_4, zeros(128),  zeros(128), patch_7,   zeros(256), zeros(256), patch_10);
error_C = my_mse(C,cast_double(inputImage))
title(['Image Reconstruction C ; Error =', num2str(error_C)]);
imshow(cast_int(C))

figure
x = ["Reconstruction A" "Reconstruction B" "Reconstruction C"];
y = [error_a error_B error_C];
bar(y);


%Compute Entropies 
e_1= compute_entropy(patch_1); 
e_2= compute_entropy(patch_2); 
e_3= compute_entropy(patch_3); 
e_4= compute_entropy(patch_4); 
e_5= compute_entropy(patch_5); 
e_6= compute_entropy(patch_6); 
e_7= compute_entropy(patch_7); 
e_8= compute_entropy(patch_8); 
e_9= compute_entropy(patch_9); 
e_10= compute_entropy(patch_10); 

f_en = figure
bar([e_1 e_2 e_3 e_4 e_5 e_6 e_7 e_8 e_9 e_10])
title('Entropy');
