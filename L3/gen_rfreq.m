function freq = gen_rfreq(N, fs)
  k_max = floor(N/2);
  freq = zeros(1, k_max + 1);
  for k = 0:k_max
    freq(k + 1) = k * fs / N;
  endfor
endfunction
