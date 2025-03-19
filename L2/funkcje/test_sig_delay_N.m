N = 1000;  % liczba probek
fs = 1000; % czestotliwosc probkowania
t = (0:N-1) / fs;

% przykladowy sygnal sin f=10Hz
x = sin(2 * pi * 10 * t);

% opoznienie o 100 probek
Nd = 100;
y = sig_delay_N(x, Nd);

figure;
subplot(2,1,1);
plot(t, x, 'b');
title('Wejsciowy');
xlabel('Czas (s)');
ylabel('Amplituda');
grid on;

subplot(2,1,2);
plot(t, y, 'r');
title('Opozniony');
xlabel('Czas (s)');
ylabel('Amplituda');
grid on;

