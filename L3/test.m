% test sygnalu stalego
N = 10;
fs = 5;
x_const = ones(1, N);          % sygnal stały (10 jedynek)
y_const = sig_rdft(x_const);   % oblicz widmo
freq = gen_rfreq(N, fs);       % wektor czestotliwosci

disp("dlugosc widma y_const: ");
disp(length(y_const));
disp("dlugosc wektora freq: ");
disp(length(freq));

% rysowanie widma amplitudowego
figure;
plot(freq, abs(y_const), 'o-');
title('widmo amplitudowe sygnalu stalego');
xlabel('czestotliwosc [Hz]');
ylabel('amplituda');

% test sygnalu sinusoidalnego
N = 20;
fs = 20;
t = (0:N-1) / fs;
x_sin = sin(2 * pi * t);  % sinus, pełny okres dla 20 prodbek
y_sin = sig_rdft(x_sin);
freq_sin = gen_rfreq(N, fs);

disp("dlugosc widma y_sin: ");
disp(length(y_sin));
disp("dlugosc wektora freq_sin: ");
disp(length(freq_sin));

figure;
subplot(2,1,1);
plot(t, x_sin, 'o-');
title('sygnal sinusoidalny w dziedzinie czasu');
xlabel('czas [s]');
ylabel('amplituda');

subplot(2,1,2);
plot(freq_sin, abs(y_sin), 's-');
title('widmo amplitudowe sygnalu sinusoidalnego');
xlabel('czestotliwosc [Hz]');
ylabel('amplituda');
