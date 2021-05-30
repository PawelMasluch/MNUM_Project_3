function [x, n] = bisection(f, a, b, eps, max_iter)
% Solwer sluzacy do znajdowania zera funkcji 
% nieliniowej za pomoca metody bisekcji.

% x - znalezione przyblizenie rozwiazania
% n - liczba iteracji potrzebnych do znalezienia rozwiazania
% f - uchwyt do funkcji, dla ktorej szukamy pierwiastka
% [a, b] - przedzial izolacji pierwiastka (zakladamy, ze f(a)*f(b) < 0)
% eps - dokladnosc rozwiazania
% max_iter - maksymalna liczba iteracji


% Poczatkowe przyblizenie rozwiazania
x = (a+b)/2;

% Licznik iteracji
n = 0;


% Poszukiwanie rozwiazania
while abs(f(x)) > eps  &&  n < max_iter
    if f(a)*f(x) < 0
        b = x; % nowym przedzialem izolacji jest [a, x]
    else
        a = x; % nowym przedzialem izolacji jest [x, b]
    end
    
    x = (a+b)/2; % kolejne przyblizenie rozwiazania
    n = n + 1; % kolejna iteracja
end



end

