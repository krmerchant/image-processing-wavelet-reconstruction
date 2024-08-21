function p = compute_entropy(input_signal)
  %quanitze first so we can convert to PMF
  x = cast_int(input_signal)
  x = x(:)
  x = x'
  p_x = histcounts(x,[unique(x) Inf],'Normalization','probability')
  log_p_x = log2(p_x);  
  p = -1*dot(p_x,log_p_x);
  
end
