function x = my_mse(original, reconstructed)
	
	r = (original - reconstructed)
	r = r(:).^2;
	x = mean(r);

end
