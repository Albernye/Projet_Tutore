min = length(data);
if min > length(data_int)
    min = length(data_int);
end
if min > length(data_obs)
    min = length(data_obs);
end
if min > length(data_obs_int)
    min = length(data_obs_int);
end


A = [data(1:min,1) data(1:min,2) data_int(1:min) data_obs(1:min) data_obs_int(1:min)];

table = array2table(A,"VariableNames",["reference","systeme reel","terme integral","observateur","observateur et terme integral"]);



writetable(table,'donees.csv');