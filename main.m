clear all;
close all;
clc
g = 9.8; %m/s^2
m = 0.1; %kg
theta0 = 0.05; %rad
theta0_dot = 0.01; %rad/s
l0 = 20; %m
r0 = 22; %m
r0_dot = 0.1; %m/s
k = 20;%N/m
dt = 0.1;

y(1) = -22; %m
y_dot(1) = 0.155;%m/s
y_ddot(1) = 0;
y(2) = y(1)+y_dot(1)*dt;
t = 0:dt:10;


for i = 2:length(t)-1
    previous = i-1;
    current = i;
    yPRE = y(previous);
    yCUR = y(current);
    f = @(yNEX)((yNEX-2*yCUR+yPRE)/(dt^2)-k*yPRE/m*(1-l0/r0)+g);
    yNEX = fzero(f, yCUR);
    y(i+1) = yNEX;
end
x(1) = 1.1;
x_dot(1) = 1.15;
x_dddot(1) = 0;
x(2) =x(1) + x_dot(1)*dt;

for i = 2:length(t)-1
    previous = i-1;
    current = 2;
    xPRE = x(previous);
    xCUR = x(current);
    f_1 = @(xNEX)((xNEX-2*xCUR+xPRE)/(dt^2)-k*xPRE/m*(1-l0/r0)+g);
    xNEX = fzero(f_1, xCUR);
    x(i+1) = xNEX;
end
plot (y,x)