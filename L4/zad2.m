pkg load signal;

% --- Parametry ---
N = 300;               % liczba próbek (np. 300)
fs = 1000;             % częstotliwość próbkowania [Hz]
t = linspace(0, (N-1)/fs, N);

% --- Liczba okresów ---
o1 = 16;               % liczba pełnych okresów
o2 = 20.5;             % liczba okresów ułamkowa (dla wycieku widma)

f1 = o1 / (N/fs);      % częstotliwość 1. sinusa
f2 = o2 / (N/fs);      % częstotliwość 2. sinusa

x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
x = x1 + x2;

% --- FFT bez okna (prostokątne okno) ---
Y_rect = fft(x);
f = linspace(-fs/2, fs/2, N);
Y_rect_shifted = fftshift(abs(Y_rect));

% --- Okna ---
w_hamming = hamming(N)';    % okno Hamming'a (transponowane do wektora poziomego)
w_blackman = blackman(N)';  % okno Blackman'a
w_hanning = hanning(N)';


% --- Sygnały po nałożeniu okien ---
x_ham = x .* w_hamming;
x_black = x .* w_blackman;
x_hanning = x .* w_hanning;

Y_hanning = abs(fft(x_hanning));
Y_ham = fft(x_ham);
Y_black = fft(x_black);

Y_ham_shifted = fftshift(abs(Y_ham));
Y_black_shifted = fftshift(abs(Y_black));
Y_hanning_shifted = fftshift(abs(fft(x_hanning)));

figure;
subplot(4,1,1);
plot(f, Y_rect_shifted, 'k'); grid on;
title('Widmo amplitudowe z oknem prostokątnym');
xlabel('Hz');

subplot(4,1,2);
plot(f, Y_ham_shifted, 'b'); grid on;
title('Widmo amplitudowe z oknem Hamming''a');
xlabel('Hz');

subplot(4,1,3);
plot(f, Y_hanning_shifted, 'g'); grid on;
title("Widmo amplitudowe z oknem Hanning'a");
xlabel("Hz");

subplot(4,1,4);
plot(f, Y_black_shifted, 'r'); grid on;
title('Widmo amplitudowe z oknem Blackman''a');
xlabel('Hz');


% --- Porównanie w czasie: sygnał oryginalny vs okienkowany ---
figure;
plot(t, x, 'k--', 'DisplayName', 'Oryginalny');
hold on;
plot(t, x_ham, 'b', 'DisplayName', 'Po oknie Hamming');
plot(t, x_black, 'r', 'DisplayName', 'Po oknie Blackman');
plot(t, x_hanning, 'g', 'DisplayName', 'Po oknie Hanning');
grid on; legend;
title('Porównanie sygnału przed i po nałożeniu okna');
xlabel('Czas [s]');

