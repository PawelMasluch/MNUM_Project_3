% Zadanie 1b) - metoda Newtona


clear;
clc;


% Uchwyt do funkcji, dla ktorej poszukujemy miejsc zerowych
f = @(x) ( 1.4*sin(x) - exp(x) + 6*x - 0.5 );


% Uchwyt do pochodnej funkcji f
f_prim = @(x) ( 1.4*cos(x) - exp(x) + 6 );


% Przyblizenia startowe
x0 = [-100 -50 -10 -5 0 0.8 1.75 1.7506 3 5 10 50 100]';

% Wartosci funkcji f dla przyblizen startowych
fx0 = f(x0);


% Ilosc przyblizen startowych
k = length(x0);


% Numery przypadkow testowych
nr = [1:k]';


% Przyblizenia pierwiastka
x = zeros(k,1);


% Wartosci funkcji f dla znalezionych przyblizen pierwiastka
fx = zeros(k,1);


% Liczby iteracji potrzebne do znalezienia przyblizenia pierwiastka
n = zeros(k,1);


% Dokladnosc rozwiazania
eps = 1e-6;


% Maksymalna liczba iteracji
max_iter = 200;


% Czasy dzialania solwerow
T = zeros(k,1);


% Znajdowanie przyblizen pierwiastka
for i=1:k
    tic;
    [x(i), n(i)] = Newton( f, f_prim, x0(i), eps, max_iter );
    T(i) = toc;
    
    fx(i) = f( x(i) );
end


% Przeskalowanie czasow do ms
T = T .* 1000;


% Wykres czasu dzialania solwera w zaleznosci od numeru przypadku testowego
figure(1);
plot(nr, T, '-o', 'MarkerSize', 10);
grid on;
title('Wykres czasu dzia³ania solwera w zale¿noœci od numeru przypadku testowego');
xlabel('Numer przypadku testowego');
ylabel('Czas dzia³ania solwera [ms]');


