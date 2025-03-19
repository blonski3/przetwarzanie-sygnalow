N = 1000;  % liczba probek
fs = 1000; % czestotliwosc probkowania
u = 0.5;     % srodek rozkładu
s = 0.1;   % odchylenie standardowe

t = (0:N-1) / fs;

gauss_signal = gen_gauss(t, u, s);

figure;
plot(t, gauss_signal, 'r');
xlabel('Czas (s)');
ylabel('Amplituda');
grid on;
