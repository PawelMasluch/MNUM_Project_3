% Zadanie 1.
% Sporzadzenie wykresu funkcji f(x) = 1.4*sin(x) - exp(x) + 6*x - 0.5
% dla x nalezacego do przedzialu [-5,5]


clear;
clc;


% Uchwyt do funkcji f(x)
f = @(x) ( 1.4*sin(x) - exp(x) + 6*x - 0.5 );


x = [-5:0.0001:5]; % argumenty
y = f(x); % wartosci funkcji


% Wykres funkcji f
figure(1);

plot(x,y);
grid on;

title('Wykres funkcji f(x) = 1.4*sin(x) - exp(x) + 6*x - 0.5');
xlabel('x');
ylabel('y');
legend('f(x)', 'Location', 'West');

