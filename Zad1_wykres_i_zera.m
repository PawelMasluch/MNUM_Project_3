% Zadanie 1.
% Sporzadzenie wykresu funkcji f(x) = 1.4*sin(x) - exp(x) + 6*x - 0.5
% dla x nalezacego do przedzialu [-5,5], 
% wraz z przyblizonymi wartosciami miejsc zerowych


clear;
clc;


% Uchwyt do funkcji f(x)
f = @(x) ( 1.4*sin(x) - exp(x) + 6*x - 0.5 );


x = [-5:0.0001:5]; % argumenty
y = f(x); % wartosci funkcji
roots = [0.2397 2.8270]; % miejsca zerowe funkcji f
values = f(roots); % wartosci funkcji f dla jej miejsc zerowych


% Wykres funkcji f oraz jej miejsca zerowe
figure(1);
hold on;

plot(x,y); % wygenerowanie wykresu
plot(roots,values, '.r', 'MarkerSize', 20); % wyroznienie pierwiastkow na wykresie
grid on;

title('Wykres funkcji f(x) = 1.4*sin(x) - exp(x) + 6*x - 0.5, wraz z miejscami zerowymi');
xlabel('x');
ylabel('y');
legend('f(x)', 'Miejsce zerowe funkcji f(x)', 'Location', 'West');

hold off;