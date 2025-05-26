pkg load signal;

% --- Funkcje pomocnicze ---
function P = sig_power(x)
    P = mean(x.^2); % moc średnia
end

function [psd, f] = sig_psd(x, fs)
    N = length(x);
    Xf = fft(x);
    Xf = Xf(1:floor(N/2)+1); % tylko dodatnie częstotliwości
    psd = (1/(fs*N)) * abs(Xf).^2;
    psd(2:end-1) = 2 * psd(2:end-1); % korekta dla częstotliwości wewnętrznych
    f = linspace(0, fs/2, length(psd));
end

function P = psd_power(psd, f)
    df = f(2) - f(1);
    P = sum(psd) * df; % całkowanie prostokątne
end

% --- Parametry ---
N = 300; fs = 1000;
t = linspace(0, (N-1)/fs, N);

% --- Testowe sygnały ---
% 1. Bez wycieku
f1 = 20; x1 = sin(2*pi*f1*t);       % 6 pełnych okresów
% 2. Z wyciekiem
f2 = 20.5; x2 = sin(2*pi*f2*t);     % ułamkowa liczba okresów
% 3. Złożony
x3 = x1 + x2;

sygnaly = {x1, x2, x3};
etykiety = {"Bez wycieku", "Z wyciekiem", "Złożony"};

% --- Okna ---
okna = {
    ones(1, N), "prostokątne";
    hamming(N)', "Hamming";
    hanning(N)', "Hanning";
    blackman(N)', "Blackman";
};

% --- Analiza ---
for s = 1:length(sygnaly)
    x = sygnaly{s};
    fprintf('\nSygnał: %s\n', etykiety{s});
    fprintf('%-15s %-10s %-10s %-10s\n', 'Okno', 'P czas', 'P psd', 'Błąd [%]');

    for k = 1:size(okna,1)
        w = okna{k,1};
        nazwa = okna{k,2};
        x_win = x .* w;

        P_time = sig_power(x_win);
        [psd, f] = sig_psd(x_win, fs);
        P_freq = psd_power(psd, f);

        blad = abs(P_time - P_freq)/P_time * 100;
        fprintf('%-15s %-10.4f %-10.4f %-10.2f\n', nazwa, P_time, P_freq, blad);
    end
end

