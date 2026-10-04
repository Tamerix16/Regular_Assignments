%% Variables
N = 0;
T = 0;
fuel_rate = 0;
delta_h = 0;
temp = 0;

%% Constants
B = 0.084;%m
L = 0.1;%m
n_cyl = 4;

n_R = 2;

rho_fuel = 0.86; %kg/L
rho_air = 0;
rho_man = 0;
V_fuel = 0;
Q_HV = 0;
rho_water = 0;
V_water =0;
m_water = 0;
Cp_water = 0;
T_wout = 0;
T_win =0;
m_exhaust;
Cp_air;
T_exhin = 0;
T_calout = 0;

%% Calculations
V_D = pi*B^2*L/4*n_cyl;
W_brake = (2*pi*N*T)/(60*10^3);
BMEP = (W_brake*n_R*10^3)/(V_D*(N/60)*10^6);
SFC = fuel_rate*rho_fuel*60*1000/W_brake;
    %calulating m_air
delta_P = (rho_man-rho_air)*g*(delta_h);
V_air = C_0*A_0*sqrt(2*delta_P/rho_air);
m_air = roh_air*V_air;
m_fuel = roh_fuel*V_fuel;
Q_in = m_fuel*QHV;
Q_cooling = m_water*Cp_water*(T_wout-T_win);
Q_exhaust = m_exhaust*Cp_air*(T_exhin-T_calout);
Qothers = Q_in-(W_brake+Q_cooling+Q_exhaust);

