N = 1000;  % liczba probek
fs = 1000; % czestotliwosc probkowania

t = gen_time(N, fs);

A = 1;     % amplituda
fsin = 10; % czestotliwosc
fi = 0;    % faze

% generowanie sygnalow
y_sin = gen_sin(t, fsin, A, fi);
y_triangle = gen_triangle(t, A, 0.5, 0.5);
y_gauss = gen_gauss(t, 0.5, 0.1);

% dodawanie
y_add = y_sin + y_triangle;

% mnozenie
y_mult = y_sin .* y_triangle;

% skladowa stala
y_add_const = y_sin + 0.5;

% zmiana amplitudy
y_amp_change = 1.5 * y_sin;

% przesuwanie sygnalu
Nd = 100;  % liczba probek
y_delay = sig_delay_N(y_sin, Nd);

% sumowanie sygnałow przesunietych o rozne opoznienia
y_delay_sum = sig_delay_N(y_sin, 50) + sig_delay_N(y_sin, 150);

% obliczanie parametrow
mean_y_sin = mean(y_sin);           % srednia
rms_y_sin = A/sqrt(2);  % wartosc skuteczna



figure;

% dodawanie
subplot(3, 2, 1);
plot(t, y_add, 'b');
title('dodawanie');
xlabel('Czas (s)');
ylabel('Amplituda');
grid on;

% mnozenie
subplot(3, 2, 2);
plot(t, y_mult, 'r');
title('mnozenie');
xlabel('Czas (s)');
ylabel('Amplituda');
grid on;

% skladowa stala
subplot(3, 2, 3);
plot(t, y_add_const, 'g');
title('skladowa stala');
xlabel('Czas (s)');
ylabel('Amplituda');
grid on;

% zmiana amplitudy
subplot(3, 2, 4);
plot(t, y_amp_change, 'm');
title('zmiana amplitudy');
xlabel('Czas (s)');
ylabel('Amplituda');
grid on;

% przesuwanie sygnalu
subplot(3, 2, 5);
plot(t, y_delay, 'c');
title('przesuwanie sygnalu');
xlabel('Czas (s)');
ylabel('Amplituda');
grid on;

% sumowanie sygnałow przesunietych o rozne opoznienia
subplot(3, 2, 6);
plot(t, y_delay_sum, 'k');
title('sumowanie sygnałow przesunietych');
xlabel('Czas (s)');
ylabel('Amplituda');
grid on;

% obliczanie parametrow
fprintf('srednia wartość sinusa: %.4f\n', mean_y_sin);
fprintf('wartość skuteczna sinusa: %.4f\n', rms_y_sin);

