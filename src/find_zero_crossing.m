function zero_crossing = find_zero_crossing(image,sigma, t)

  g_mask  = generate_log(sigma);
  edge_detection = conv2(image, g_mask ); 
  zero_crossing = thresh_matrix(edge_detection , t); 
  [r c] = size(image);
  [r_2 c_2] = size(edge_detection);
  
  s = (r_2-r)/2;
  zero_crossing = zero_crossing(s:s+r-1,s:s+r-1);
end
