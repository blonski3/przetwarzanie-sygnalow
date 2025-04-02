function y = sig_rdft(x)
  N = length(x);
  n = 0:(N-1);               % Wektor numerów próbek
  y = zeros(1, floor(N/2) + 1);  % Prealokacja wyniku (dla parzystego N floor(N/2)=N/2)

  % Obliczenie widma dla składowych k = 0,1,...,floor(N/2)
  for k = 0:floor(N/2)
      f = exp(-1i * 2 * pi * k * n / N);  % Wektor wartości funkcji bazowej
      y(k+1) = dot(x, f) / N;              % Obliczenie danej składowej widma
  endfor

  % Podwajamy składowe poza k = 0 (DC) oraz (dla parzystego N) poza składową Nyquista
  if mod(N,2) == 0
      % Dla parzystego N: nie podwajamy pierwszej i ostatniej składowej
      y(2:end-1) = 2 * y(2:end-1);
  else
      % Dla nieparzystego N: nie podwajamy tylko składowej DC
      y(2:end) = 2 * y(2:end);
  end
endfunction
