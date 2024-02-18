%% 예제 제목
clear

% DC motor
R = 2;                % Ohms
L = 0.5;                % Henrys
Km = 1;              % torque constant
Kb = 0.1;               % back emf constant
Kf = 0.01;               % Nms
J = 0.02;               % kg.m^2/s^2

% caution :less than 1e-3 of Ts cause count error in encoder
Ts = 1e-2; 
encoder_scale = 1/12/4 *2*pi;

%Low pass filter for Speed
num = 1;
den = [0.05 1];

G = tf(num,den);
Gd = c2d(G, Ts);

num_Gd = Gd.Num{:};
den_Gd = Gd.Den{:};

% Voltage limit
Vlim = 12; %voltage



% Angular speed reference
Wref = 300;

% Controller
KP = 0.05; 
KI = 0.25;
KD = 0;
%sim("DCmotor_Speed_Ctrl_SILS.slx")