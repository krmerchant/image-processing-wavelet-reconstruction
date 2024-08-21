function image = copy_from_mask(mask,signal)
  [x,y] = find(mask > 0);
  image = zeros(size(signal))
  image(x,y) = signal(x,y);
end
