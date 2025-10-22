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
title('Closed Loop Step Response (K = 1)')
xlabel('Time (s)')
ylabel('Amplitude')

%% 1.6
KTask1 = 0.824;
five_pecernt_overshoot = tf([KTask1*Km],[1 Alpha Km*KTask1]);
figure
step(five_pecernt_overshoot,t)
title('Closed Loop Step Response (5%Overshoot)')
xlabel('Time (s)')
ylabel('Amplitude')
%% 2.3
K_16 = tf([1.6*KTask1*Km], [1 Alpha 1.6*KTask1*Km]);
K_10= tf([KTask1*Km], [1 Alpha KTask1*Km]);
K_02 = tf([0.2*KTask1*Km], [1 Alpha 0.2*KTask1*Km]);
figure
hold on
step(K_16,t)
step(K_10,t)
step(K_02,t)
hold off
legend ('1.6','1','0.2');
title('Step Resopons (Varying K)')
%%
Kfo = 0.686919;
Gfo = tf([10*Alpha*Km*Kfo],[1 Alpha+10*Alpha 10*Alpha^2 Kfo*10*Alpha*Km]);
figure
step(Gfo)
%%
Kso = 0.496633;
Gso = tf([2*Alpha*Km*Kso],[1 Alpha+2*Alpha 2*Alpha^2 Kso*2*Alpha*Km]);
figure
step(Gso)

%% task 4.2
Klead = 3.27717;
Glead = feedback(tf([Klead*Km],[1 6.54 0]),1);
figure
step(Glead)