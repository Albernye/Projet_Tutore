clear;

T = readtable("donees.csv");


N = length(T.reference);
t = linspace(0,12,N);


figure(1)
hold on
plot(t,T.reference)
plot(t,T.systemeReel)
plot(t,T.termeIntegral)
plot(t,T.observateur)
plot(t,T.observateurEtTermeIntegral)
legend('reference','systeme reel','terme integral','observateur','observateur&terme integral')