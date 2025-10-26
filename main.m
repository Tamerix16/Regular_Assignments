clear all;
m = 0.1; %kg
theta_0 = 0.05; %rad
theta_0_dot = 0.01; %rad/s
l0 = 20; %meters
r0 = 22; %meters
r0_dot = 0.1; % m/s

k = 20; %N/m
g = 9.8; %m/s2
x(1) = 22*sin(0.05);
y(1) = 22*cos(0.05);
x_dot0 = r0_dot*sin(theta_0) + r0*theta_0_dot*cos(theta_0);
y_dot0 = r0_dot*cos(theta_0) - r0*theta_0_dot*sin(theta_0);
dt = 0.1;
y(2) = y(1)+y_dot0*dt;
x(2) = x(1)+x_dot0*dt;
t_1 = 0:dt:10;
for j = 2:length(t_1)-1
    l = sqrt(x(j).^2+y(j).^2);
    x_prev = x(j-1);
    y_prev = y(j-1);
    x_cur = x(j);
    y_cur = y(j);
    f_x = @(x_new)(m*((x_new-(2*x_cur)+x_prev) / (dt^2)) + k*(sqrt(x_cur^2+y_cur^2)-l0)*(x_cur/(sqrt(x_cur^2+y_cur^2))));
    f_y = @(y_new)(m*((y_new-(2*y_cur)+y_prev) / (dt^2)) + k*(sqrt(x_cur^2+y_cur^2)-l0)*(y_cur/(sqrt(x_cur^2+y_cur^2)))-m*g);
    x_new = fzero(f_x,x_cur);
    y_new = fzero(f_y, y_cur);
    x(j+1) = x_new;
    y(j+1) = y_new;
end

figure
plot(x,y)
title('Path')
xlabel('X (m)')
ylabel('Y (m)')
set(gca, 'YDir', 'reverse')
figure
subplot(1,3,1)
plot(t_1,x)
title('X Motion')
ylabel('Amplitude (m)')
xlabel('Time (s)')
subplot(1,3,2)
plot(t_1,y)
title('Y Motion')
xlabel('Time (s)')
ylabel('Amplitude (m)')
subplot(1,3,3)
plot(x,y)
title('Path')
xlabel('X (m)')
ylabel('Y (m)')
set(gca, 'YDir', 'reverse')


%% task 7
k = 10;
m= 10;
x(1) = 22*sin(0.05);
y(1) = 22*cos(0.05);
x_dot0 = r0_dot*sin(theta_0) + r0*theta_0_dot*cos(theta_0);
y_dot0 = r0_dot*cos(theta_0) - r0*theta_0_dot*sin(theta_0);
dt = 0.003;
y(2) = y(1)+y_dot0*dt;
x(2) = x(1)+x_dot0*dt;
t = 0:dt:60;
for i = 2:length(t)-1
    l = sqrt(x(i).^2+y(i).^2);
    x_prev = x(i-1);
    y_prev = y(i-1);
    x_cur = x(i);
    y_cur = y(i);
    f_x = @(x_new)(m*((x_new-(2*x_cur)+x_prev) / (dt^2)) + k*(sqrt(x_cur^2+y_cur^2)-l0)*(x_cur/(sqrt(x_cur^2+y_cur^2))));
    f_y = @(y_new)(m*((y_new-(2*y_cur)+y_prev) / (dt^2)) + k*(sqrt(x_cur^2+y_cur^2)-l0)*(y_cur/(sqrt(x_cur^2+y_cur^2)))-m*g);
    x_new = fzero(f_x,x_cur);
    y_new = fzero(f_y, y_cur);
    x(i+1) = x_new;
    y(i+1) = y_new;
end

f_theta = @(t)(0.052.*cos(0.7.*t-0.28));
f_r = @(t)(7.8*cos(1.*t+0.000224)+29.8);

x_test = f_r(t).*sin(f_theta(t));
y_test = f_r(t).*cos(f_theta(t));
plot(x_test,y_test)
set(gca, 'YDir', 'reverse')
figure
plot(t,x_test)
figure
plot(t,y_test)
subplot(1,3,1)
plot(t,x)
hold on
plot(t,x_test)
hold off
title('X Motion')
ylabel('Amplitude (m)')
xlabel('Time (s)')
subplot(1,3,2)
plot(t,y)
hold on
plot(t,y_test)
hold off
title('Y Motion')
xlabel('Time (s)')
ylabel('Amplitude (m)')
subplot(1,3,3)
plot(x,y)
hold on
plot(x_test,y_test)
hold off
title('Path')
xlabel('X (m)')
ylabel('Y (m)')
set(gca, 'YDir', 'reverse')

