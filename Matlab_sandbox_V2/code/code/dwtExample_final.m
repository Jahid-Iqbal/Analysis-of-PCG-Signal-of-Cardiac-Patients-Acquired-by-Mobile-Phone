%Copyright 2016 The MathWorks, Inc.

%% Load a signal
%load noisysig.mat
load ('eshad heart 2 S1 S2.mat');
figure; 
subplot(2,1,1); plot(Z); grid on; title('Original signal'); axis tight; 
subplot(2,1,2); plot(Z); title('Original signal with noise'); 
axis tight; grid on;


%%  Decompose signal using Discrete Wavelet Transform  
dwtmode('per','nodisplay');
wname = 'db5';
level = 7;
[C, L] = wavedec(Z,level,wname);

plotDetCoefHelper(Z,C,L); %helperFunction to plot the coefficients at every level

%% Analyze the subbands and determine the threshold

%% Denoise the signal 
fd = wden(Z,'rigrsure','s','sln',level,wname);

figure; 
subplot(2,1,1); 
plot(Z);axis tight; grid on;title('Noisy Signal');
subplot(2,1,2)
plot(fd); axis tight; grid on;
title(sprintf('Denoised Signal SNR:  %0.2f dB',-20*log10(norm(abs(Z-fd))/norm(Z))));

%% Comparing with other techniques
figure; 
subplot(2,2,1); 
plot(Z);axis tight; grid on;title('Noisy Signal');
subplot(2,2,2)
plot(fd); axis tight; grid on;
title(sprintf('Wavelet Denoising SNR:  %0.2f dB',-20*log10(norm(abs(Z-fd))/norm(Z))));
subplot(2,2,3)
fsg = sgolayfilt(Z,31,101);
plot(fsg); axis tight; grid on;
title(sprintf('Savitzky Golay SNR:  %0.2f dB',-20*log10(norm(abs(Z-fsg))/norm(Z))));
subplot(2,2,4)
movavg = 1/20*ones(20,1);
fmv = filtfilt(movavg,1,Z);
plot(fmv); axis tight; grid on;
title(sprintf('Moving Average SNR:  %0.2f dB',-20*log10(norm(abs(Z-fmv))/norm(Z))));