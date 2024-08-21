function mask = generate_log(sigma)
	width_factor = 4;
	window_size = 1 + 2*width_factor*sigma
	max_range = floor(window_size/2);
	[x ,y] =  meshgrid(-max_range:max_range,-max_range:max_range);
	%mask = ((x.^2 + y.^2 - 2*sigma^2)./sigma^4).*exp(-(x.^2 + y.^2)./(2*sigma^2));
	gaussian =  exp(-(x.^2 + y.^2)./(2.*sigma^2));
	%mask = ((x.^2 + y.^2 - 2*sigma^2)./sigma^4).*gaussian;
	mask = ((x.^2 + y.^2 - 2*sigma^2)./(pi*sigma.^4)).*gaussian;

end
