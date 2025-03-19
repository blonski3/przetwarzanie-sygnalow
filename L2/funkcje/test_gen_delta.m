N = 10;  % liczba próbek
fs = 1000; % częstotliwość próbkowania

% generowanie wektora czasu
t = gen_time(N, fs);  % zakładam, że masz tę funkcję już zdefiniowaną

% generowanie sygnału delta
delta_signal = gen_delta(t);

I = 0:(N-1);
figure;
stem(I, delta_signal, 'filled');  % rysowanie dyskretnego sygnału delta
xlabel('Indeks próbki');
ylabel('Amplituda');
grid on;
