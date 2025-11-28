%% Physical constants
g = 9.81;                       % gravity acceleration [m/sec^2]
%% Physical parameters
m =      ;						% wheel weight [kg]
R = 0.027;						% wheel radius [m]
Jw = m * R^2 / 2;				% wheel inertia moment [kgm^2]
M =    ;                        % body weight [kg]
W = 0.105;						% body width [m]
D = 0.1;						% body depth [m]
h = 0.21;       				% body height [m]
L =    ;						% distance of the center of mass from the wheel axle [m]
Jpsi = M * L^2 / 3;				% body pitch inertia moment [kgm^2]
Jphi = M * (W^2 + D^2) / 12;	% body yaw inertia moment [kgm^2]
fm = 0.0022;					% friction coefficient between body & DC motor
fw = 0;           				% friction coefficient between wheel & floor
%% Motors parameters
Jm = 1e-5;						% DC motor inertia moment [kgm^2]
Rm = 6.69;						% DC motor resistance [Om]
Kb = 0.468;						% DC motor back EMF constant [Vsec/rad]
Kt = 0.317;						% DC motor torque constant [Nm/A]
K_PWM = 8.087;                  % Volts to PWM value coefficient [1/V]


%% Constantes definition
alpha =  Kt / Rm;
beta =  Kt * Kb / Rm + fm;
E_11 = (2 * m + M) * R^2 + 2 * Jw + 2 * Jm;
E_12 = M * L * R - 2  * Jm;
E_22 = M * L^2 + Jpsi + 2 * Jm;


%% Part 1: Model
% E=


%s1.StateName = {'theta', 'psi', 'theta_dot', 'psi_dot'};
%s1.InputName = {'U'};


%% For discrete control and simulation
Ts = 0.004;                     % Control system sample time
Psi0 = deg2rad(8);             % Initial value to disturb the system

