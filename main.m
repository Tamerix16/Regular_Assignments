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
title('Step Response Extra Fast Pole With K = 0.686919')
xtitle('Time (s)')
ytitle('Amplitude')
%%
Kso = 0.496633;
Gso = tf([2*Alpha*Km*Kso],[1 Alpha+2*Alpha 2*Alpha^2 Kso*2*Alpha*Km]);
figure
step(Gso)
title('Step Response Extra Slow Pole With K = 0.496633')
xtitle('Time (s)')
ytitle('Amplitude')
%% task 3.5
GO_fast = tf([Kfo*Km],[1 Alpha Km*Kfo]);
GO_Slow = tf([Kso*Km],[1 Alpha Km*Kso]);
Gfo_original = tf([10*Alpha*Km*KTask1],[1 Alpha+10*Alpha 10*Alpha^2 KTask1*10*Alpha*Km]);
Gfo_slow = tf([10*Alpha*Km*Kso],[1 Alpha+10*Alpha 10*Alpha^2 Kso*10*Alpha*Km]);
Gso_fast = tf([2*Alpha*Km*Kfo],[1 Alpha+2*Alpha 2*Alpha^2 Kfo*2*Alpha*Km]);
Gso_Original = tf([2*Alpha*Km*KTask1],[1 Alpha+2*Alpha 2*Alpha^2 KTask1*2*Alpha*Km]);
figure
step(GO_fast);
title('Original System Step Response With Kfo Gain')
xlabel("Time")
ylabel('Amplitude')
figure
step(Gso_fast);
title('Slow System Step Response With Kfo Gain')
xlabel('Time (s)')
ylabel('Amplitude')
figure
step(Gfo_slow);
title('Fast System Step Response With Kso Gain')
xlabel('Time (s)')
ylabel('Amplitude')
figure
step(GO_Slow);
title('Original System Step Response With Kso Gain')
xlabel('Time (s)')
ylabel('Amplitude')
figure
step(Gso_Original);
title('Slow System Step Response With Original Gain')
xlabel('Time (s)')
ylabel('Amplitude')
figure
step(Gfo_original);
title('Fast System Step Response With Original Gain')
xlabel('Time (s)')
ylabel('Amplitude')
%% task 4.2
Klead = 3.27717;
Glead = feedback(tf([Klead*Km],[1 6.54 0]),1);
figure
step(Glead,t)