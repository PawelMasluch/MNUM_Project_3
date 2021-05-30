% Zadanie 2.
% Sporzadzenie wykresu wielomianu f(x) = x^4 + 3*x^3 - 8*x^2 + 4*x + 2
% dla x nalezacego do przedzialu [-5,5]


clear;
clc;


% Uchwyt do funkcji f(x)
f = @(x) ( x.^4 + 3*x.^3 - 8*x.^2 + 4.*x + 2 );


x = [-5:0.0001:4]; % argumenty
y = f(x); % wartosci funkcji


% Wykres funkcji f
figure(1);

plot(x,y);
grid on;

title('Wykres funkcji f(x) = x^4 + 3*x^3 - 8*x^2 + 4*x + 2');
xlabel('x');
ylabel('y');
legend('f(x)', 'Location', 'West');

