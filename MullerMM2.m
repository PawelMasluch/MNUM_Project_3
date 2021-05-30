function [x, n] = MullerMM2(a, x0, eps, max_iter)
% Solwer sluzacy do znajdowania zera funkcji 
% wielomianowej f(t) za pomoca metody Mullera MM2.

% x - znalezione przyblizenie rozwiazania
% n - liczba iteracji potrzebnych do znalezienia rozwiazania
% a - wspolczynniki wielomianu f(t) (od najwyszej do najnizszej potegi zmiennej t) 
% x0 - przyblizenie startowe
% eps - dokladnosc rozwiazania
% max_iter - maksymalna liczba iteracji


% Wspolczynniki wielomianu f'(t) (od najwyszej do najnizszej potegi zmiennej t) 
a_prim = polyder(a);


% Wspolczynniki wielomianu f''(t) (od najwyszej do najnizszej potegi zmiennej t) 
a_bis = polyder(a_prim);


% Poczatkowe przyblizenie rozwiazania
x = x0;

% Licznik iteracji
n = 0;

% Wartosc wielomianu dla przyblizenia startowego
f = polyval(a,x);


% Poszukiwanie rozwiazania
while abs(f) > eps  &&  n < max_iter
    
    % Wartosc 1. pochodnej wielomianu dla aktualnego przyblizenia rozwiazania
    f_prim = polyval(a_prim,x);
    
    % Wartosc 2. pochodnej wielomianu dla aktualnego przyblizenia rozwiazania
    f_bis = polyval(a_bis,x);
    
    % Mianowniki wartosci z_plus oraz z_minus (odpowiednio)
    den_z_plus =  f_prim + sqrt(f_prim^2 - 2*f*f_bis);
    den_z_minus = f_prim - sqrt(f_prim^2 - 2*f*f_bis);
    
    % Wartosci z_plus oraz z_minus 
    z_plus =  -2*f/den_z_plus;
    z_minus = -2*f/den_z_plus;
    
    if abs( den_z_plus ) >= abs( den_z_minus )
        x = x + z_plus; % kolejne przyblizenie rozwiazania
    else
        x = x + z_minus; % kolejne przyblizenie rozwiazania
    end
    
    n = n + 1; % kolejna iteracja
    
    f = polyval(a,x); % wartosc funkcji dla kolejnej iteracji
end



end