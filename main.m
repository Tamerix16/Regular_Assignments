%%1.1
clear all;
Km = 6.8528;
Alpha = 3.2737;
num = [Km];
den = [1 Alpha 0];
open_loop = tf(num,den);
t = linspace(0,3.5,10000);
open_loop = step(open_loop,t);
figure;
plot(t, open_loop)
title('Open Loop Step Response');
xlabel('Time (s)');
ylabel('Amplitude');
%% 1.5
closed_loop = tf([Km],[1 Alpha Km]);
figure
step(closed_loop,t)

%% 1.6
KTask1 = 0.824;
five_pecernt_overshoot = tf([KTask1*Km],[1 Alpha Km*KTask1]);
figure
step(five_pecernt_overshoot,t)

%% 2.3
K_16 = tf([1.6*KTask1*Km], [1 Alpha 1.6*KTask1*Km]);
K_10= tf([KTask1*Km], [1 Alpha KTask1*Km]);
K_04 = tf([0.4*KTask1*Km], [1 Alpha 0.4*KTask1*Km]);
figure
hold on
step(K_16,t)
step(K_10,t)
step(K_04,t)
hold off
legend ('1.6','1','0.4');
%%
K = 0.686919;
testing = tf([10*Alpha*Km*K],[1 Alpha+10*Alpha 10*Alpha^2 K*10*Alpha*Km]);
figure
step(testing)
%%
K = 0.496633;
testing = tf([2*Alpha*Km*K],[1 Alpha+2*Alpha 2*Alpha^2 K*2*Alpha*Km]);
figure
step(testing)
%%
k = 0.822;
testing = tf([k*Km],[1 Alpha k*Km]);
figure
step(testing)

%% task 4.2
backup = feedback(tf([3.27717*Km],[1 6.54 0]),1)
step(backup)