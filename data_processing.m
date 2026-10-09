clear all
close all
clc
%% Variables
N=1990; % RPM
T = 115;%Nm
Fuel_Rate = 0.124; %L/min
Temp = 298.15; %Deg K
delta_h = 226; %mm

%% Constants
B = 0.084;%m
L = 0.1;%m
ncyl = 4;
n_R = 2;
P_air = 101325;
Q_HV = 44; %MJ/kg
R = 8.314;
M_air = 0.028964;
Co = 0.6;
Ao = pi*(0.03^2)/4;
roh_man = 1000;
roh_Fuel = 0.86; %kg/L 
%% Algorithm
VD = pi*B^2*L/4*ncyl;
W_brake = 2*pi*N*T/(60*10^3); %kW
BMEP = W_brake*n_R*10^3/(VD*(N/60)*10^6); %MPa

SFC = Fuel_Rate*roh_Fuel*60*1000/W_brake; %g/kW*hr

roh_air = P_air*M_air/(R*Temp);
%
Delta_P = (roh_man-roh_air)*9.81*delta_h/10^3;
V_air = Co*Ao*sqrt(2*Delta_P/roh_air);
%calculate m_air
m_air = roh_air*V_air;
%

n_v = m_air/(roh_air*VD*N/(60*2));
%Calculate m_fuel
m_fuel = (Fuel_Rate/(60*1000))*roh_Fuel*1000;
%
AFR = m_air/m_fuel;
n_th = W_brake*10^3/(m_fuel*Q_HV*10^6);
disp('Output Torque: '+string(T)+' Nm')
disp('Break Power: '+string(W_brake)+' kW');
disp('BMEP: '+string(BMEP)+' MPa');
disp('SFC: '+string(SFC)+' g/kW*h');
disp('Air-Fuel Ratio: '+string(AFR));
disp('Volumetric Efficiency: '+string(n_v));
disp('Thermal Efficiency: '+string(n_th));

%% Build Graphs
RPM_50 = [1390,1786,1987];
RPM_100 = [1392,1788,1990];
Power_50 = [9.3,10.8,12];
Power_100 = [12.9,22.1,23.8];
Torque_50 = [63,56,57];
Torque_100 = [123,118,115];
Power_50 = [9.17,10.47,11.86];
Power_100 = [17.93,22.09,23.97];
BMEP_50 = [0.3571,0.31746,0.3231];
BMEP_100 = [0.69728,0.66893,0.6519];
SFC_50 = [303.85,290.67,269.74];
SFC_100 = [282.03,275.58,266.99];
AFR_50 = [28.67,33.3,34.56];
AFR_100 = [15.8,16.5,17.28];
Vol_eff_50 = [0.73,0.7228,0.70671];
Vol_eff_100 = [0.73,0.714,0.7056];
Therm_eff_50 = [0.269,0.281,0.3033];
Therm_eff_100 = [0.29,0.2969,0.3065];
