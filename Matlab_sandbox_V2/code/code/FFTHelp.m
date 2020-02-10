
% MATLAB program for running FFT
SampRate = length(Z);

TotalTime = 10; %TotalTime = 0.05;

t = 0:1/SampRate:TotalTime;
%load(outhi); %x = sin(2*pi*100*t)+sin(2*pi*500*t) + sin(2*pi*1000*t);
%x = load('y.mat');
y = Z;    %y = x;

N =length(Z);
%subplot(2, 1, 1)
%plot(t,y)
%title('100, 500, and 1000 Hz Sine Waves')
%xlabel('time (milliseconds)')

Y = fft(y,N);
Z = abs(fft(y,N));

Pyy = Y.* conj(Y) / N;

f = SampRate*(0:N/2)/N;
subplot(2, 2, 3)
plot(f,Pyy(1:N/2+1))
title('Power content of y')
xlabel('frequency (Hz)')

subplot(2, 2, 4)
plot(f,Z(1:N/2+1))
title('FFT content of y')
xlabel('frequency (Hz)')