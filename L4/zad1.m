pkg load signal;

% --- Parametry ---
N = 200;                  % liczba próbek
fs = 1000;                % częstotliwość próbkowania [Hz]
t = linspace(0, (N-1)/fs, N);

% --- Liczba okresów ---
o1 = 4;                   % okresy dla x1
o2 = 7;                   % okresy dla x2

f1 = o1 / (N/fs);         % częstotliwość 1. sinusa
f2 = o2 / (N/fs);         % częstotliwość 2. sinusa

x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
x_sum = x1 + x2;

% --- FFT ---
X1 = fft(x1);
X2 = fft(x2);
Xsum = fft(x_sum);

% --- Oś częstotliwości ---
f = linspace(-fs/2, fs/2, N);

% --- Widma amplitudowe (przesunięcie do środka) ---
X1_amp = fftshift(abs(X1));
X2_amp = fftshift(abs(X2));
Xsum_amp = fftshift(abs(Xsum));
Xsum_amp_manual = X1_amp + X2_amp;

% --- Wykresy ---
figure;

subplot(3,2,1);
plot(f, X1_amp, 'r'); grid on;
title('Widmo amplitudowe |X1|'); xlabel('Częstotliwość [Hz]');

subplot(3,2,2);
plot(f, X2_amp, 'b'); grid on;
title('Widmo amplitudowe |X2|'); xlabel('Częstotliwość [Hz]');

subplot(3,2,3);
plot(f, Xsum_amp_manual, 'm'); grid on;
title('Suma widm: |X1| + |X2|'); xlabel('Częstotliwość [Hz]');

subplot(3,2,4);
plot(f, Xsum_amp, 'g'); grid on;
title('Widmo sumy: |FFT(x1 + x2)|'); xlabel('Częstotliwość [Hz]');

subplot(3,2,[5 6]);
plot(f, Xsum_amp, 'g', 'DisplayName', '|FFT(x1 + x2)|'); hold on;
plot(f, Xsum_amp_manual, '--m', 'DisplayName', '|X1| + |X2|');
grid on; legend;
title('Porównanie: widmo sumy vs suma widm'); xlabel('Częstotliwość [Hz]');

