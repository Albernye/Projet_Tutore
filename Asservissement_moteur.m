clear;
close;
clc;

%% Fonctions de transfert
s = tf('s');

Batt_Voltage = 7.2;
K1 = 0.01;
K2 = 0.5036;
K3 = K2;

TF_inter_1 = 1/(4.7e-3*s+5.11);
TF_inter_2 = 1/(0.0021*s + 0.0012);

TF = zpk(K1*Batt_Voltage*((TF_inter_1*K2*TF_inter_2)/(1+K3*TF_inter_1*K2*TF_inter_2)));
P = pole(TF);

TF = K1*Batt_Voltage*((TF_inter_1*K2*TF_inter_2)/(1+K3*TF_inter_1*K2*TF_inter_2));
TF2 = TF/s;

%num = TF.Numerator

K = dcgain(TF);

%% Conservation du pole le plus rapide -1087.2
TF_aprox = 3674/(s+24);

TF_U_theta = TF_aprox/s;

%% Representation d'etat matrice compagne
A = compan(cell2mat(TF_U_theta.Denominator));
B = [1 0]';
tmp = cell2mat(TF_U_theta.Numerator);


% Commandabilite du systeme
Comm = [B A*B];
rank(Comm)


