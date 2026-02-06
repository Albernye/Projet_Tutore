% S1 = ss(A1,B1,C1,zeros(2,1));
% S1d = c2d(S1,Ts);
% A1d = S1d.A; B1d = S1d.B; C1d = S1d.C; D1d = S1d.D;
% 
% S2 = ss(A2,B2,C2,0);
% S2d = c2d(S2,Ts);
% A2d = S2d.A; B2d = S2d.B; C2d = S2d.C; D2d = S2d.D;

K1 = lqrd(A1,B1,C1'*C1,0.01,Ts);
K2 = A2(2,2)^2/(4*B2(2,1));

K_PWM = 8.087; 
gamma = 0.999;