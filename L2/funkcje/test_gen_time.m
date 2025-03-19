N = 10;  % liczba probek
fs = 1000; % czestotliwosc probkowania

% generowanie wektora czasu
t = gen_time(N, fs);

I = 0:(N-1);
figure;
plot(I, t, 'o-');
xlabel('Indeks próbki');
ylabel('Amplituda');
grid on;


