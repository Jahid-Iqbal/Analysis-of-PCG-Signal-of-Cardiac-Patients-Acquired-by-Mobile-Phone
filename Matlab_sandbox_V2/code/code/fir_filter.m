%MATLAB Program for FIR filter with Kaiser window
%load('S2.mat');
%load('y.mat');
%Z=y;
%ecg = load('Normal02S1S2_1.mat'); % LOAD OUR DATA
fs=length(Z);    %sampling rate = 1000 Hz. Also SAMPLES PER SECOND.
           % Also called SAMPLES PER SECOND.
fc = 700;
wn= 2*fc/fs;    % cut off range's middle point
slen = length(Z);
t=[1:slen]/fs;
bhi = fir1(20,wn,'low',chebwin(21,30));
outhi = filter(bhi,1,Z);
freqz(bhi,1)
figure;

%subplot(2,1,1)
%plot(t,Z)
%title('Original Signal')
%ys = ylim;

%subplot(2,1,2)
plot(t,outhi)
title('Low pass Filtered Signal')
xlabel('Time (samples)')
ylabel('Amplitude')
ylim(ys);
