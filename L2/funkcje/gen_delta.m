function signal = gen_delta(time)
  N = length(time);
  signal = zeros(1, N);  % tworzymy wektor zer
  signal(1) = 1;         % wstawiamy 1 w pierwszej probce
end

