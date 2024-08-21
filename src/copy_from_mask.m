function image = copy_from_mask(mask,signal)
  idx = find(mask > 0);
  image = zeros(size(signal))
  image(idx) = signal(idx);
end
