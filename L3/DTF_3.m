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

% obliczanie widma za pomocą FFT ---
freq = gen_cfreq(N, fs);  % funkcja generująca czestotliwoscci dla FFT
y1 = fft(x1) / N;
y2 = fft(x2) / N;
y3 = fft(x3) / N;
y4 = fft(x4) / N;
y5 = fft(x5) / N;

% przesuniecie widma do postaci dwustronnej
y1 = fftshift(y1);
y2 = fftshift(y2);
y3 = fftshift(y3);
y4 = fftshift(y4);
y5 = fftshift(y5);

% wizualizacja wynikow
figure;
subplot(3,2,1);
plot(time, x2, 'b'); title('suma dwóch sinusow'); xlabel('Czas [s]'); ylabel('amplituda');

subplot(3,2,2);
plot(freq, abs(y2), 'b'); title('dwustronne widmo x1'); xlabel('czestotliwość [Hz]'); ylabel('|Y(f)|');

subplot(3,2,3);
plot(time, x4, 'r'); title('gauss'); xlabel('Czas [s]'); ylabel('amplituda');

subplot(3,2,4);
plot(freq, abs(y4), 'r'); title('dwustronne widmo x2'); xlabel('czestotliwość [Hz]'); ylabel('|Y(f)|');

subplot(3,2,5);
stem(time, x5, 'g'); title('sygnal trojkatny'); xlabel('czas [s]'); ylabel('amplituda');

subplot(3,2,6);
plot(freq, abs(y5), 'g'); title('dwustronne widmo x3'); xlabel('czestotliwość [Hz]'); ylabel('|Y(f)|');

