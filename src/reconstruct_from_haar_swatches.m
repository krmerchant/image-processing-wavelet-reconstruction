function reconstructedImage = reconstruct_from_haar_swatches(ll, lh, hl, hh)

%  v_h = [-0.5; 0.5];
%  v_l = [1;1];
% 
%  h_h = [-0.5 0.5];
%  h_l = [1 1];
  v_h = [-0.5; 0.5];
  v_l = [1;1];
 
  h_h = [-0.5 0.5];
  h_l = [1 1];

 

  r_ll = upsample(ll, 2);
  r_lh = upsample(lh, 2);  
  r_hl = upsample(hl, 2);  
  r_hh = upsample(hh, 2);  

  r_ll = conv2(r_ll, v_l); 
  r_lh = conv2(r_lh, v_h);

  r_hl = conv2(r_hl, v_l);
  r_hh = conv2(r_hh, v_h);
  
 

  %print rr_ll and rr_lh size
  r_sum_1 = r_ll + r_lh;
  r_sum_2 = r_hl + r_hh;

  r_sum_1 = conv2(upsample(r_sum_1',2)',h_l);
  r_sum_2 = conv2(upsample(r_sum_2',2)',h_h);
  
  reconstructedImage = r_sum_1 + r_sum_2; 
  [l w] = size(ll);
  reconstructedImage = reconstructedImage(1:2*l,1:2*w);
end
