function RunEnKSLongRun(Ne,tF,ob_step,infl,locrad)

FileName = strcat('./LongProblemSetups/SynthExp_Gap_',num2str(tF), ...
                    '_obStep_',num2str(ob_step),'.mat');
load(FileName)

X = MakeInitialEnsemble(mub,Lb,Ne,Nx);
[xEnKS,tracePEnKS,~]=EnKS(X,Z,locrad,infl,H,R,Nx,Nobs,nAssims, ...
    Nt, md, mn, Um, Uz, as, Np, Ng, xS, xF, dt);
rmse = sqrt(sum((xEnKS-Xt).^2)/Nx);
spread = sqrt(tracePEnKS/Nx);

rmse = mean(rmse(200:end));
spread = mean(spread(200:end));

FileName = strcat('./ResultsTuned/EnKSResults_Gap_',num2str(tF), ...
    '_obStep_',num2str(ob_step),...
    '_Ne_',num2str(Ne), ...
    '_infl_',num2str(infl), ...
    '_loc_',num2str(locrad),'.mat');
save(FileName,'rmse','spread')

