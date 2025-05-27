clc; clear; close all;

% ustawienia podstawowe
N = 120; % liczba prodbek (musi być parzysta)
fs = 500; % czestotliwosc próbkowania [Hz]

% os czasu
time = (0:N-1) / fs;

% definicje sygnalow

% 1 sygnal sinusoidalny spelniający warunek Shannona
f1 = fs / 10;  % przykladowa czestotliwosc (fs / czynnik pierwszy)
x1 = sin(2 * pi * f1 * time);

% 2 suma dwoch sinusoid o roznych czestotliwosciach
f2 = fs / 5;
x2 = sin(2 * pi * f1 * time) + sin(2 * pi * f2 * time);

% 3 delta kroneckera (impuls w srodku)
x3 = zeros(1, N);
x3(N/2) = 1;

% 4 impuls Gaussa
sigma = 0.005; % szerokosc impulsu (w sekundach)
x4 = exp(-((time - (N/2)/fs).^2) / (2 * sigma^2));

% 5 impuls trojkatny
x5 = max(1 - abs((time - (N/2)/fs) / (N/(4*fs))), 0);

% 6 suma roznych sygnalow
x6 = x1 + x3 + x5;

% obliczanie widma za pomoca wczesniej napisanych funkcji
freq = gen_rfreq(N, fs);
y1 = sig_rdft(x1);
y2 = sig_rdft(x2);
y3 = sig_rdft(x3);
y4 = sig_rdft(x4);
y5 = sig_rdft(x5);
y6 = sig_rdft(x6);

% wizualizacja wynikow
figure;
subplot(3,2,1);
plot(time, x2, 'b'); title('suma dwóch sinusow'); xlabel('czas [s]'); ylabel('amplituda');

subplot(3,2,2);
stem(freq, abs(y2), 'b'); title('widmo amplitudowe x1'); xlabel('czestotliwosc [Hz]'); ylabel('|Y(f)|');

subplot(3,2,3);
plot(time, x4, 'r'); title('gauss'); xlabel('czas [s]'); ylabel('amplituda');

subplot(3,2,4);
stem(freq, abs(y4), 'r'); title('widmo amplitudowe x2'); xlabel('czestotliwość [Hz]'); ylabel('|Y(f)|');

subplot(3,2,5);
stem(time, x5, 'g'); title('sygnał trójkątny'); xlabel('czas [s]'); ylabel('Amplituda');

subplot(3,2,6);
stem(freq, abs(y5), 'g'); title('widmo amplitudowe x3'); xlabel('czestotliwość [Hz]'); ylabel('|Y(f)|');

