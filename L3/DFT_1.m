clc; clear; close all;

% parametry
N = 20; % liczba probek
k_values = [2, 5, 10, 19]; % Wybrane wartości k

% wektor numerów probek
n = 0:(N-1);

% tworzenie okna z wykresami
num_k = length(k_values);  % liczba wartości k
rows = ceil(num_k / 2);    % liczba wierszy w układzie subplotów

figure;
for i = 1:num_k
    k = k_values(i);

    % obliczenie funkcji bazowej
    f = exp(-1i * 2 * pi * k * n / N);

    % nowy subplot
    subplot(rows, 2, i);
    hold on; grid on;

    % rysowanie czesci rzeczywistej i urojonej
    plot(n, real(f), '-o', 'LineWidth', 1.2, 'DisplayName', 'Re');
    plot(n, imag(f), '-o', 'LineWidth', 1.2, 'DisplayName', 'Im');

    % opis wykresu
    title(['k = ' num2str(k)]);
    xlabel('numer próbki n');
    ylabel('wartosc');
    legend show;
endfor

