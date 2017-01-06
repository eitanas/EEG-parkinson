%% sync test
clear all;
clc;
data = importdata('WWT1_MC-P05.txt');
data = data.data;

t = data(:,1);
c3 = data(:,5);
c4 = data(:,18);

c3_v = [c3;c3;c3;c3(1:16643)];
c4_v = [c4;c4;c4;c4(1:16643)];

%% fft
s_fr = 256;

alpha_start_fr = 7.8;
alpha_end_fr = 15.6;
delta1_start_fr = 0.5;
delta1_end_fr = 2;

c3_alpha_wave = ExtractSignalwave(alpha_start_fr,alpha_end_fr,c3_v,s_fr);
c4_alpha_wave = ExtractSignalwave(alpha_start_fr,alpha_end_fr,c4_v,s_fr);

c3_delta1_wave = ExtractSignalwave(delta1_start_fr,delta1_end_fr,c3_v,s_fr);
%% plotting  alpha 10-11

start_sec = 10;
end_sec = 13;

start_idx = start_sec * s_fr;
end_idx = end_sec * s_fr;

c3_test_alpha_wave = c3_alpha_wave(start_idx:end_idx);
c4_test_alpha_wave = c4_alpha_wave(start_idx:end_idx);

c3_delta1_wave = c3_delta1_wave(start_idx:end_idx);

n = length(c3_test_alpha_wave);
t = 1:1:n;

figure;
plot(t,c3_test_alpha_wave);
title('c3 alpha');

figure;
plot(t,c4_test_alpha_wave);
title('c4 alpha');
hold on;
%% hilbert transform and phase
c3_phase_hilbert = hilbert(c3_test_alpha_wave);
c4_phase_hilbert = hilbert(c4_test_alpha_wave);



c3_delta1_hilbert = hilbert(c3_delta1_wave);
c3_delta1_phase = angle(c3_delta1_hilbert);

c3_phase = angle(c3_phase_hilbert);
c4_phase = angle(c4_phase_hilbert);

figure;
plot(t,c3_phase , t,c4_phase);
grid on;
title('c3 & c4 phase');


c3_delta1_phase = angle(hilbert(c3_delta1_wave));
%% delta phase
figure;
delta_phi = c4_phase - c3_phase;
plot(t,delta_phi,'o');
grid on;
title('\Delta phase');


delta_phi_alpha_delta1 = c3_phase - c3_delta1_phase;
%% calculating gamma
exponent = exp(1i * delta_phi);
plot(exponent, 'o')

real_part = real(exponent);
imaginary_part = imag(exponent);

gamma = abs(mean(exponent))
real_avg = sum(real_part) / length(real_part);
imag_avg = sum(imaginary_part) / length(imaginary_part);

hold on;
plot(real_avg , imag_avg , 'o');
grid on;



%% calculating amplitude phase
c3_amplitude_hilbert = abs(hilbert(c3_test_alpha_wave));
c4_amplitude_hilbert = abs(hilbert(c4_test_alpha_wave));

c3_second_hilbert = hilbert(c3_amplitude_hilbert);
c4_second_hilbert = hilbert(c4_amplitude_hilbert);

c3_alpha_amplitude_phase = angle(c3_second_hilbert);
c4_alpha_amplitude_phase = angle(c4_second_hilbert);

delta_amp = c3_alpha_amplitude_phase - c4_alpha_amplitude_phase;
figure;
plot(t, delta_amp)
title('c3 & c4 alpha wave \Delta amplitude');
grid on;


%% amplitude synchronization alpha and delta

delta1_start_fr = 0.5;
delta1_end_fr = 2;

N = length(c3_v);
fft_t = 1:1:N;

c3_delta1_wave = ExtractSignalwave(delta1_start_fr,delta1_end_fr,c3_v,s_fr);


c3_delta1_hilbert = abs(hilbert(c3_delta1_wave));

c3_delta1_second_hilbert = hilbert(c3_delta1_hilbert);
c3_delta1_second_hilbert_phase = angle(c3_delta1_second_hilbert);

delta_amp_alpha_delta1 = c3_alpha_amplitude_phase - c3_delta1_second_hilbert_phase; 

plot(t, delta_amp_alpha_delta1);
title('alpha & delta1 c3 ele. wave \Delta amplitude');
grid on;



