function [ll, lh, hl, hh] = generate_haar_swatches(inputImage)
  vertHighpass = [1;-1];
  horHighpass = [1 -1];

  vertLowpass =0.5*[1; 1];
  horLowpass = 0.5*[1 1];

  %apply vertical filtering and downsampling 
  h_v = conv2(inputImage, horHighpass, 'same');
  l_v = conv2(inputImage, horLowpass, 'same');
  %transpose twice so you can go column by column 
  h_v = downsample(h_v', 2)';
  l_v = downsample(l_v', 2)';
  
  ll = downsample(conv2(l_v,vertLowpass,'same'),2);
  hh = downsample(conv2(h_v,vertHighpass,'same'),2);
 

  lh = downsample(conv2(l_v, vertHighpass,'same'),2);
  hl = downsample(conv2(h_v, vertLowpass,'same'),2);

end
