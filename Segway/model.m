%% Physical constants
g = 9.81;                       % gravity acceleration [m/sec^2]
%% Physical parameters
m = 0.032;						% wheel weight [kg]
R = 0.027;						% wheel radius [m]
Jw = m * R^2 / 2;				% wheel inertia moment [kgm^2]
M = 0.837;                      % body weight [kg]
W = 0.105;						% body width [m]
D = 0.1;						% body depth [m]
h = 0.21;       				% body height [m]
L = 0.15;						% distance of the center of mass from the wheel axle [m]
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
E = [E_11 E_12;
    E_12 E_22];

F = [2*beta -2*beta;
    -2*beta 2*beta];

H = [2*alpha;-2*alpha];

G = [0 0;
    0 -M*g*L];

A_1 = [zeros(2) eye(2);
    inv(E)*G inv(E)*F];

B_1 = [0;0;
    inv(E)*H];

% C_1 = [1 0 0 0;
%        0 0 0 0;
%        0 0 0 0;
%        0 0 0 1];  On ne peut qu'avoir la position des roues et la vitesse
%        angulaire du robot

s1 = ss(A_1, B_1, eye(4), zeros(4,1));

s1.StateName = {'theta', 'psi', 'theta_dot', 'psi_dot'};
s1.InputName = {'U'};

% Etats d'équilibre du système : psi = [0; -90; 90]
% psi = 0 est un état d'équilibre instable 

%% For discrete control and simulation
Ts = 0.004;                     % Control system sample time
Psi0 = deg2rad(8);             % Initial value to disturb the system

s2 = c2d(s1,Ts,'zoh');  % On vérifie bien que s2.A == expm(A_1*Ts)
Ad = s2.A;
Bd = s2.B;
Cd = s2.C;
Dd = s2.D;

% Limite de stabilité dans le plan complexe en temps discret est le cerlce
% unité

% Commandabilité : On a bien rank(ctrb(Ad,Bd)) = 4

%% Retour d'état

