N = 1000;  % liczba probek
fs = 1000; % czestotliwosc probkowania
t = gen_time(N, fs);  % wektor czasu

A = 1;   % Amplituda
tr = 0.5;  % czas narastania
tf = 0.5;  % czas opadania

triangle_signal = gen_triangle(t, A, tr, tf);

figure;
plot(t, triangle_signal, 'b');
xlabel('Czas (s)');
ylabel('Amplituda');
grid on;

