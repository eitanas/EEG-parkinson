function g = Gamma_surr( signal1, signal2)
% this function gets two raw EEG signal and calculate thier gamma
% synchronization index using cross-modulation
%the first signal is flipped in order to get surrogate effect
signal1 = fliplr(signal1);

a = angle(hilbert(signal1));
b = angle(hilbert(signal2));

delta = a-b;
exponent = exp(1i * delta);
g = abs(mean(exponent));

end