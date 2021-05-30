function [x, n] = Newton(f, f_prim, x0, eps, max_iter)
% Solwer sluzacy do znajdowania zera funkcji 
% nieliniowej za pomoca metody Newtona.

% x - znalezione przyblizenie rozwiazania
% n - liczba iteracji potrzebnych do znalezienia rozwiazania
% f - uchwyt do funkcji, dla ktorej szukamy pierwiastka
% f_prim - uchwyt do pochodnej funkcji f
% x0 - przyblizenie startowe
% eps - dokladnosc rozwiazania
% max_iter - maksymalna liczba iteracji


% Poczatkowe przyblizenie rozwiazania
x = x0;


% Licznik iteracji
n = 0;


% Poszukiwanie rozwiazania
while abs(f(x)) > eps  &&  n < max_iter
    x = x - f(x)/f_prim(x); % kolejne przyblizenie rozwiazania
    n = n + 1; % kolejna iteracja
end



end