pkg load signal;

% --- Funkcje pomocnicze ---
function avg = sig_avg(x)
    avg = mean(x);
end

function P = sig_power(x)
    P = mean(x.^2); % moc średnia
end

function rms = sig_rms(x)
    rms = sqrt(mean(x.^2));
end

% --- Parametry sygnału ---
A = 10;          % amplituda
f = 15;         % częstotliwość
fs = 1000;      % częstotliwość próbkowania
N = 1000;       % liczba próbek
t = linspace(0, (N-1)/fs, N);
x = A * sin(2*pi*f*t);  % sygnał sinusoidalny

% --- Obliczenia numeryczne ---
avg_num = sig_avg(x);
power_num = sig_power(x);
rms_num = sig_rms(x);

% --- Obliczenia analityczne ---
avg_an = 0;                 % średnia sinusa = 0
power_an = (A^2)/2;         % moc średnia = A^2/2
rms_an = A / sqrt(2);       % RMS = A / sqrt(2)

% --- Błędy względne ---
err_avg = 100 * abs((avg_an - avg_num) / (avg_an + eps)); % +eps zapobiega dzieleniu przez 0
err_power = 100 * abs((power_an - power_num) / power_an);
err_rms = 100 * abs((rms_an - rms_num) / rms_an);

% --- Wyświetlenie wyników ---
fprintf('\n%-20s %-15s %-15s %-15s\n', 'Parametr', 'Wartość num.', 'Wartość anal.', 'Błąd [%]');
fprintf('%-20s %-15.6f %-15.6f %-15.2f\n', 'Średnia', avg_num, avg_an, err_avg);
fprintf('%-20s %-15.6f %-15.6f %-15.2f\n', 'Moc średnia', power_num, power_an, err_power);
fprintf('%-20s %-15.6f %-15.6f %-15.2f\n', 'Wartość RMS', rms_num, rms_an, err_rms);

