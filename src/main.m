clc;
clear all
close all
inputImage = imread('../data/LENA.TIF');

%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 1
%%%%%%%%%%%%%%%%%%%%%%%%%%
%First Order
[ll, patch_8,  patch_9, patch_10] = generate_haar_swatches(inputImage);
[llll, patch_5,  patch_6, patch_7] = generate_haar_swatches(ll);
[patch_1,  patch_2,  patch_3,  patch_4] = generate_haar_swatches(llll);


% only 5,6,7,8,9
a = standard_h_recon(patch_1, patch_2, patch_3,  patch_4, zeros(128),  zeros(128), zeros(128),   zeros(256), zeros(256), patch_10);
error_a = my_psnr(a,cast_double(inputImage))


% only 2,3,4,5,6 
B = standard_h_recon(patch_1,zeros(64),zeros(64),zeros(64),  zeros(128),  zeros(128), patch_7,   patch_8,  patch_9,patch_10);
error_B = my_psnr(B,cast_double(inputImage))



% only 2,3,4,5,6 

C = standard_h_recon(patch_1, patch_2, patch_3,  patch_4, zeros(128),  zeros(128), patch_7,   zeros(256), zeros(256), patch_10);
error_C = my_psnr(C,cast_double(inputImage))

f1 = figure;
subplot(1,3,1)
imshow(cast_int(a));
title(['Reconstruction A; PSNR = ',num2str(error_a)]);
subplot(1,3,2)
imshow(cast_int(B));
title(['Reconstruction B; PSNR = ',num2str(error_B)]);

subplot(1,3,3)
imshow(cast_int(C));
title(['Reconstruction C; PSNR = ',num2str(error_C)]);

%


%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 2: Compute Entropies of sub_bands
%%%%%%%%%%%%%%%%%%%%%%%%%%
e_0= compute_entropy(inputImage); 
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
names = categorical(["original image" "subband_1" "subband_2" "subband_3" "subband_4" "subband_5" "subband_6" "subband_7" "subband_8" "subband_9" "subband_{10}"]);
bar(names,[e_0 e_1 e_2 e_3 e_4 e_5 e_6 e_7 e_8 e_9 e_10])
title('Sub-band Entropy')



%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 3: Compute Entropies of sub_bands
%%%%%%%%%%%%%%%%%%%%%%%%%%
s_1 = 1.0;
t_1 = 0.2;
mask_1 = find_zero_crossing(patch_1, s_1, t_1);
patch_2_down = copy_from_mask(mask_1,patch_2);
patch_3_down = copy_from_mask(mask_1,patch_3);
patch_4_down = copy_from_mask(mask_1,patch_4);

recon_llll =  reconstruct_from_haar_swatches(patch_1,patch_2_down,patch_3_down,patch_4_down);
f_level1 = figure()
subplot(1,3,1)
imshow(cast_int(mask_1));
title('Mask');
subplot(1,3,2)
imshow(cast_int(llll));
title('Original LLLL');
subplot(1,3,3)
imshow(cast_int(recon_llll));
e1 = my_psnr(recon_llll,llll);
title(['Reconstructed LLLL; PSNR = ',num2str(e1)]);

%Level 2
s_2 = 1.0;
t_2 = 0.1;
mask_2 = find_zero_crossing(recon_llll, s_2, t_2);
patch_5_down = copy_from_mask(mask_2,patch_5);
patch_6_down = copy_from_mask(mask_2,patch_6);
patch_7_down = copy_from_mask(mask_2,patch_7);

recon_ll =  reconstruct_from_haar_swatches(recon_llll,patch_5_down,patch_6_down,patch_7_down);
f_level2 = figure()
subplot(1,3,1)
imshow(cast_int(mask_2));
title('Mask');
subplot(1,3,2)
imshow(cast_int(ll));
title('Original LL');
subplot(1,3,3)
imshow(cast_int(recon_ll));
e2 = my_psnr(recon_ll,ll);
title(['Reconstructed LL; PSNR = ',num2str(e2)]);

%Level 3
s_3 = 1.0;
t_3 = 0.1;
mask_3 = find_zero_crossing(recon_llll, s_3, t_3);
patch_8_down = copy_from_mask(mask_2,patch_8);
patch_9_down = copy_from_mask(mask_2,patch_9);
patch_10_down = copy_from_mask(mask_2,patch_10);

recon_input =  reconstruct_from_haar_swatches(recon_ll,patch_8_down,patch_9_down,patch_10_down);
f_level3 = figure()
subplot(1,3,1)
imshow(cast_int(mask_3));
title('Mask');
subplot(1,3,2)
imshow(cast_int(inputImage));
title('Original Image');
subplot(1,3,3)
imshow(cast_int(recon_input));
e3 = my_psnr(recon_input,cast_double(inputImage));
title(['Reconstructed Image; PSNR = ',num2str(e3)]);


