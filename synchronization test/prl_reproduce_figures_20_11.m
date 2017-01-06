clear all;
clc;
data = importdata('WWT1_MC-P05.txt');
data = data.data;

t = data(:,1);
c3 = data(:,5);
c4 = data(:,18);
c3_v = [c3;c3;c3;c3(1:16643)];
c4_v = [c4;c4;c4;c4(1:16643)];

s_fr = 256;                 % sample frequency

alpha_start_fr = 7.8;
alpha_end_fr = 15.6;
delta1_start_fr = 0.5;
delta1_end_fr = 2;

c3_alpha_wave = ExtractSignalwave(alpha_start_fr,alpha_end_fr,c3_v,s_fr);
c3_delta1_wave = ExtractSignalwave(delta1_start_fr,delta1_end_fr,c3_v,s_fr);

start_sec = 10;             % 3 seconds 
end_sec = 13;

start_idx = start_sec * s_fr;
end_idx = end_sec * s_fr;

raw_signal = (c3_v(start_idx:end_idx))';
c3_test_alpha_wave = c3_alpha_wave(start_idx:end_idx);
c3_test_delta1_wave = c3_delta1_wave(start_idx:end_idx);


n = length(c3_test_alpha_wave);
t = 1:1:n;
%%
subplot(3,2,1);
plot(t,c3_test_alpha_wave,t,imag(hilbert(c3_test_alpha_wave)),t,abs(hilbert(c3_test_alpha_wave)));
grid on;
title('alpha');  xlabel('t(1/256 s)');
xlabel('t(1/256 s)');
legend('real','imaginary','absolute','Location','Best');

subplot(3,2,3);
plot(t,raw_signal);
grid on;
title('raw signal');
xlabel('t');

subplot(3,2,5);
plot(t,c3_test_delta1_wave,t,imag(hilbert(c3_test_delta1_wave)),t,abs(hilbert(c3_test_delta1_wave)));
grid on;
title('delta1');
xlabel('t(1/256 s)');
legend('real','imaginary','absolute','Location','Best');

%%
start_sec = 0;
end_sec = 30;
subplot(3,2,2);
c3_test_alpha_wave = c3_alpha_wave(start_idx:end_idx);
[amp_alpha,amp_alpha_phase] = getInstantAmpAndPhase(c3_test_alpha_wave);
n = length(c3_test_alpha_wave);
t = 1:1:n;
plot(t,amp_alpha,t,amp_alpha_phase,'-')
grid on;
title('alpha instantaneous amplitude and phase'); xlabel('t'); ylabel('U');

subplot(3,2,6);
c3_test_delta1_wave = c3_delta1_wave(start_idx:end_idx); 
[amp_delta1,amp_delta1_phase] = getInstantAmpAndPhase(c3_test_delta1_wave);
plot(t,amp_delta1,t,amp_delta1_phase,'-');
grid on;
title('delta1 instantaneous amplitude and phase'); xlabel('t'); ylabel('U');


%%
subplot(3,2,4);
delta_phase = amp_alpha_phase - amp_delta1_phase;
plot(delta_phase);

exponent = exp(1i * delta_phase);
plot(exponent, 'o')

real_part = real(exponent);
imaginary_part = imag(exponent);


real_avg = sum(real_part) / length(real_part);
imag_avg = sum(imaginary_part) / length(imaginary_part);

hold on;
plot(real_avg , imag_avg , 'o');
grid on;

gamma = abs(mean(exponent))












