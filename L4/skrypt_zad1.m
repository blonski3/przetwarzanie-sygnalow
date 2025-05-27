% --- Parametry ---
N = 500;       % liczba próbek
fs = 1000;     % częstotliwość próbkowania [Hz]
o = 5;         % liczba okresów

% --- Funkcje pomocnicze ---
function f = sig_sinfreq(N, fs, o)
  % Oblicza częstotliwość w Hz, by o okresów zmieściło się w N próbkach
  f = (o * fs) / N;
end

function t = gen_time(N, fs)
  % Generuje wektor czasu dla N próbek przy częstotliwości próbkowania fs
  t = (0:N-1) / fs;
end

function x = gen_sin(t, freq, A, phi)
  % Generuje sinusoidę: A * sin(2πft + φ)
  x = A * sin(2 * pi * freq * t + phi);
end

% --- Obliczenia ---
time = gen_time(N, fs);
freq = sig_sinfreq(N, fs, o);
x1 = gen_sin(time, freq, 1, 0);

% --- Wykres ---
plot(time, x1);
title(['Sinusoida: ', num2str(o), ' okresów']);
xlabel('Czas [s]');
ylabel('Amplituda');
grid on;

