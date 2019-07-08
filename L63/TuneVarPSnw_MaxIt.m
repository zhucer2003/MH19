function TuneVarPSnw_MaxIt(Ne,inflAll,SetUp,Gap,MaxIt)

load(strcat('./SetUps/SetUp_',num2str(SetUp),'_Gap_',num2str(Gap),'.mat'))

for kk = 1:length(inflAll)
    infl = inflAll(kk);
    [Xa,xAll,traceP] = varPSnw_MaxIt(Ne,z,xo,sqrtB,infl,dt,dT,H,R,MaxIt);

    rmse = sqrt(sum((Xa-y(:,Gap+1:Gap:end)).^2)/3);
    rmse = mean(rmse(200:end)); % time average
    spread = sqrt(traceP/3);
    spread = mean(spread(200:end)); % time average
    
    Filename = strcat('./Results/varPSnw_Results_SetUp_',num2str(SetUp),'_Gap_',num2str(Gap), ...
        '_Ne_',num2str(Ne),'_infl_',num2str(infl),'MaxIt',num2str(MaxIt),'.mat');
%     save(Filename,'y','z','t','tObs','xAll','Xa','rmse','spread')
    save(Filename,'rmse','spread')
end