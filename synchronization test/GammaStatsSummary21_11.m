%% load data
clear all; clc;

filename1 = ['WWT1_MC-P05.txt'];
data1 = load_data(filename1);

filename2 = ['WWT1_MC-P21.txt'];
data2 = load_data(filename2);

params = load_settings_params ();

subplot(3,2,1)
g = GammaStats(data1,data2,'delta1','alpha',params,10,11);
title('alpha & delta1 Gamma sync. index distribution (1sec)');
xlabel('\gamma'); ylabel('# of occurences');
text(0,1,['mean = 0.043'])
mean(g)


subplot(3,2,3)
g = GammaStats(data1,data2,'delta1','alpha',params,10,12);
title('alpha & delta1 Gamma sync. index distribution (2sec)');
xlabel('\gamma'); ylabel('# of occurences');
text(0,1,['mean = 0.038'])
mean(g)

subplot(3,2,5)
g = GammaStats(data1,data2,'delta1','alpha',params,10,13);
title('alpha & delta1 Gamma sync. index distribution (3sec)');
xlabel('\gamma'); ylabel('# of occurences');
text(0,1,['mean = 0.035'])
mean(g)

%%
subplot(3,2,2)
g = GammaStats(data1,data2,'delta1','betha',params,20,21);
title('betha & delta1 Gamma sync. index distribution (1sec)');
xlabel('\gamma'); ylabel('# of occurences');
text(0,1,['mean = 0.025'])
mean(g)

subplot(3,2,4)
g = GammaStats(data1,data2,'theta','alpha',params,10,11);
title('alpha & theta Gamma sync. index distribution (1sec)');
xlabel('\gamma'); ylabel('# of occurences');
text(0,1,['mean = 0.122'])
mean(g)

subplot(3,2,6)
g = GammaStats(data1,data2,'delta1','alpha',params,10,11);
title('sigma & betha Gamma sync. index distribution (1sec)');
xlabel('\gamma'); ylabel('# of occurences');
text(0,1,['mean = 0.043'])
mean(g)