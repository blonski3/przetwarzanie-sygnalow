function freq = gen_cfreq(N, fs)
  if mod(N, 2) == 0
    % Dla parzystego N: typowy zakres fft to [0, 1, ..., N/2-1, -N/2, -N/2+1, ..., -1]
    freq = (0:N-1) * (fs / N);        % częstotliwości przed przesunięciem
    freq = fftshift(freq) - fs/2;       % przesunięcie, by uzyskać uporządkowany zakres
  else
    % Dla nieparzystego N:
    freq = (0:N-1) * (fs / N);
    freq = fftshift(freq) - fs/2;
  end
endfunction
