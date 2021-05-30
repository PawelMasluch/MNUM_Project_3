% Zadanie 1a) - metoda bisekcji


clear;
clc;


% Uchwyt do funkcji, dla ktorej poszukujemy miejsc zerowych
f = @(x) ( 1.4*sin(x) - exp(x) + 6*x - 0.5 );


% Przedzialy [a(i), b(i)] izolacji pierwiastka
a = [-5, 4, 0.5,  0, -5, -1,   -5,   -5, -1, 2.5, 2.5, 0.5]'; % poczatki przedzialow
b = [-1, 5, 2.5, 10,  5,  4,  0.5,  2.5,  1,   3,   5,   5]'; % konce przedzialow


% Wartosci funkcji f dla poczatkow przedzialow izolacji pierwiastka
fa = f(a);


% Wartosci funkcji f dla koncow przedzialow izolacji pierwiastka
fb = f(b);


% Ilosc przedzialow izolacji pierwiastka
k = length(a);


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


% Czasy dzialania solwera
T = zeros(k,1);


% Znajdowanie przyblizen pierwiastka
for i=1:k
    tic;
    [x(i), n(i)] = bisection( f, a(i), b(i), eps, max_iter );
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

