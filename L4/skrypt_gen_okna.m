pkg load signal;

% --- Funkcje narzędziowe ---
function avg = sig_avg(x)
  avg = mean(x);
end

function pwr = sig_power(x)
  pwr = mean(x.^2);
end

function rms = sig_rms(x)
  rms = sqrt(mean(x.^2));
end

% --- Parametry sygnału ---
A = 2;                  % amplituda
fs = 1000;              % cz. próbkowania
T = 1;                  % czas trwania [s]
t = linspace(0, T, fs*T); % wektor czasu
f = 5;                  % częstotliwość sygnału

x = A * sin(2*pi*f*t);  % sygnał sinusoidalny

% --- Obliczenia numeryczne ---
avg_num = sig_avg(x);
pwr_num = sig_power(x);
rms_num = sig_rms(x);

% --- Obliczenia analityczne ---
avg_ana = 0;              % średnia sinusa = 0
pwr_ana = (A^2)/2;        % moc średnia = A^2/2
rms_ana = A / sqrt(2);    % wartość skuteczna = A/sqrt(2)

% --- Obliczenie błędu względnego (% błędu) ---
err_avg = 100 * abs(avg_ana - avg_num) / max(1e-12, abs(avg_ana));
err_pwr = 100 * abs(pwr_ana - pwr_num) / abs(pwr_ana);
err_rms = 100 * abs(rms_ana - rms_num) / abs(rms_ana);

% --- Wyniki w postaci tabeli ---
fprintf('\nParametr       Numerycznie     Analitycznie     Błąd względny [%%]\n');
fprintf('---------------------------------------------------------------------\n');
fprintf('Średnia        %10.6f     %10.6f        %10.6f\n', avg_num, avg_ana, err_avg);
fprintf('Moc średnia    %10.6f     %10.6f        %10.6f\n', pwr_num, pwr_ana, err_pwr);
fprintf('Wartość skut.  %10.6f     %10.6f        %10.6f\n', rms_num, rms_ana, err_rms);

% --- Opcjonalnie: zapis do zmiennej tablicowej 3x3 ---
wyniki = [
  avg_num, avg_ana, err_avg;
  pwr_num, pwr_ana, err_pwr;
  rms_num, rms_ana, err_rms;
];

% --- Wyświetlenie wyniku jako tablica ---
disp("\nTablica wyników [xn, xa, blad_wzgledny_%]:");
disp(wyniki);

