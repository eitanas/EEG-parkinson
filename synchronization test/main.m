%% load data
clear all; clc;

filename1 = ['WWT1_MC-P05.txt'];
data1 = load_data(filename1);

filename2 = ['WWT1_MC-P21.txt'];
data2 = load_data(filename2);

params = load_settings_params ();
%% choose electrodes, brain waves and time interval to extract

electrode_num = 7;
start_time = 1;              %in seconds
end_time = 3;

signal1 = ExtractSignalwave(params.alpha_st_fr, params.alpha_end_fr, data1(:,electrode_num), params.sampling_fr);
signal2 = ExtractSignalwave(params.delta1_st_fr, params.delta1_end_fr, data1(:,electrode_num), params.sampling_fr);

start_idx = start_time * params.sampling_fr;
end_idx = end_time * params.sampling_fr;

signal1 = signal1(start_idx:end_idx);
signal2 = signal2(start_idx:end_idx);


%% calculating Gamma
gamma = Gamma(signal1,signal2);

%% calculating amplitude phase difference

delta = Amplitude_phase(signal1) - Amplitude_phase(signal2);
plot(delta)

%% gamma stats
rng(0)
gamma_v = 0;

for i=1:30
    for j=i+1:30
        r1 = randi(30);
        start_time= r1;
        end_time = start_time + 1;
        
        s1 = get_signal_interval(data1,'delta2',i,params,start_time,end_time);
        
        s2 = get_signal_interval(data2,'delta1',j,params,start_time,end_time);
        
        g = Gamma(s1,s2);
        gamma_v = [gamma_v, g];
        
    end
end


histogram(gamma_v,50)
mean(gamma_v)






     





