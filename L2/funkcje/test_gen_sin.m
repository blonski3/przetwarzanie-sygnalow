N = 1000;  % liczba probek
fs = 1000; % czestotliwosc probkowania

% generowanie wektora czasu
t = gen_time(N, fs);

A = 1;      % amplituda
fsin = 1;  % freq
fi = 0;     % faze

y_sin = gen_sin(t, fsin, A, fi);

figfile_store('dane_sin', t, y_sin);

figure;
plot(t, y_sin, 'b');
xlabel('Indeks próbki');
ylabel('Amplituda');
grid on;

