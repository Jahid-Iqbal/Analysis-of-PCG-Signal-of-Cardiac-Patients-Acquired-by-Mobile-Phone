
% MATLAB PROGRAM to plot ECG data
% Data collection and Plot

clear all               % clears all active variables
close all

%heartBeat = load('Z.mat');  % PROBLEM
load('Z.mat');

fs = 48836; %sampling rate = 1000 Hz. Also SAMPLES PER SECOND.
           % Also called SAMPLES PER SECOND.
slen = length(Z);
time=[1:slen]/fs;
figure
plot(time, Z)% PROBLEM
axis tight;
xlabel('Time in seconds');
ylabel('Heart Beat');
