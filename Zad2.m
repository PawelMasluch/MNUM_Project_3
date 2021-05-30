% Zadanie 1b) - metoda Mullera MM2 z deflacja czynnikiem liniowym


clear;
clc;


% Wspolczynniki wielomianu f(x) 
% (od najwyzszej do najnizszej potegi zmiennej x)
a = [1 3 -8 4 2];


% Stopien wielomianu f(x)
k = length(a)-1;


% Przyblizenia startowe
x0 = [-50 -10 -5 -2 -1 0 1 2 5 10 50]';

% Wartosci funkcji f dla przyblizen startowych
fx0 = polyval(a, x0);


% Ilosc przyblizen startowych (i przypadkow testowych zarazem)
m = length(x0);


% Dokladnosc rozwiazania
eps = 1e-6;


% Maksymalna liczba iteracji
max_iter = 200;


% Numery przypadkow testowych
nr = [1:m]';


% Przyblizenia pierwiastka
x = zeros(m,k);


% Wartosci funkcji f dla znalezionych przyblizen pierwiastka
fx = zeros(m,k);


% Liczby iteracji potrzebne do znalezienia przyblizenia pierwiastka 
% (dla kazdego przypadku testowego)
n = zeros(m,k);


% Sumaryczne liczby iteracji dla przypadkow testowych
sum_n = zeros(m,1);


% Dokladnosc rozwiazania
eps = 1e-6;


% Maksymalna liczba iteracji
max_iter = 200;


% Czasy dzialania solwerow dla poszczegolnych przyblizen pierwiastka 
% (w ramach kazdego przypadku testowego)
T = zeros(m,k);


% Sumaryczne czasy dzialania solwerow dla przypadkow testowych
sum_T = zeros(m,1);


% Metoda Mullera MM2 z deflacja czynnikiem liniowym
for i=1:m % dla kazdego przypadku testowego
    
    % Wspolczynniki wielomianu biezacego;
    % poczatkowo oryginalne wspolczynniki wielomianu f(x)
    b = a;
    
    for j=1:k % dla kazdego pierwiastka
        
        tic;
        
        % Znalezione przyblizenie pierwiastka
        [x(i,j), n(i,j)] = MullerMM2(b, x0(i), eps, max_iter);
        
        T(i,j) = toc;
        
        
        % Przeskalowanie czasu do ms
        T(i,j) = T(i,j) * 1000;
        
        % Obliczenie wartosci wielomianu f(x) 
        % dla znalezionego przyblizenia pierwiastka
        fx(i,j) = polyval( a, x(i,j) );
        
        % Deflacja czynnikiem liniowym
        [b, r] = deconv( b, [1 -x(i,j)] );
    end
    
    sum_n(i) = sum( n(i,:) );
    sum_T(i) = sum( T(i,:) );
end


% Wykres sumarycznego czasu dzialania solwera w zaleznosci od przypadku testowego
figure(1);
plot(nr, sum_T, '-o', 'MarkerSize', 10);
grid on;
title('Wykres sumarycznego czasu dzia³ania solwera w zale¿noœci od przypadku testowego');
xlabel('Numer przypadku testowego');
ylabel('Sumaryczny czas dzia³ania solwera [ms]');

