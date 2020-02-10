
% MATLAB PROGRAM to plot ECG data & FIR filter with Chebyshev window 

clear all               % clears all active variables
close all

load('Normal01S1S2_2.mat');        % ecg = load('ecg_lfn.dat');
fs = 8989; %sampling rate 

slen = length(Z); %slen = length(ecg);
t=[1:slen]/fs;
figure
plot(t, Z) %plot(t, ecg)
axis tight;
xlabel('Time in seconds');
ylabel('ECG');

% ----------------------filter-----------------%

fc = 200; % cutoff frequency
wn= 2*fc/fs;
bhi = fir1(4,wn,'low',chebwin(5,5));
outhi = filter(bhi,1,Z);
figure;

subplot(2,1,1)
plot(t,Z)
title('Original Signal')
ys = ylim;

subplot(2,1,2)
plot(t,outhi)
title('Highpass Filtered Signal')
xlabel('Time (s)')
ylim(ys);