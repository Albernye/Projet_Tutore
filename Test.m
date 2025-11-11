clear;
close;
clc;

%% Fonction de transfert
s = tf('s');

Batt_Voltage = 7.2;
K1 = 0.01;
K2 = 0.5036;
K3 = K2;

TF_inter_1 = 1/(4.7e-3*s+5.11);
TF_inter_2 = 1/(0.0021*s + 0.0012);

TF = K1*Batt_Voltage*((TF_inter_1*K2*TF_inter_2)/(1+K3*TF_inter_1*K2*TF_inter_2));
TF2 = TF/s;
P = pole(TF);

K = dcgain(TF)

TF_zpk = 1/(s-P(3));

K2 = dcgain(TF_zpk);
new_K = K/K2;

TF_zpk = TF_zpk*new_K;
TF_U_theta = TF_zpk/s;

dcgain(TF_zpk)

%% Representation d'etat matrice compagne
A = compan(cell2mat(TF_U_theta.Denominator));
B = [1 0]';
tmp = cell2mat(TF_U_theta.Numerator);


denom = cell2mat(TF_U_theta.Denominator);
num = cell2mat(TF_U_theta.Numerator);

A = [0 1;-denom(3) -denom(2)];
B = [num(2) num(3)]';
C = eye(2);
D = zeros(2,1);
