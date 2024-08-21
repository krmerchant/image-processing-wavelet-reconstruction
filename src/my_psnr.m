function x = my_psnr(original, reconstructed)
  
  mse = my_mse(original,reconstructed);
  x = 10*log10(255^2/mse);
end
