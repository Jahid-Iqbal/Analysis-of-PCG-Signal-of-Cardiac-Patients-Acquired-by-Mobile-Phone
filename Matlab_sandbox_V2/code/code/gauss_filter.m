rng default

%load('Z.mat');
%y = downsample(Z,61);   % downsampling y = 8000
y=Z;
Fs = 800; % sampling frequency = 8000/10 
slen = length(y);
t=[1:slen]/Fs;

fc1 = 8; % must be less than Fs/2 128/2 = 64
fc2 = 12;
Wn1 = (2/Fs)*fc1;%0 < Wn < 1.0
Wn2 = (2/Fs)*fc2;
c = (Wn2+Wn1)/2;
w = (Wn2+Wn1)/3;

%--------------------------FFT----------------------------------%

x = Z;

[n,m] = size(x);

N=n;

k=0:N-1;

ty = fft(x);% FFT works along the coloumns

filter1 = cgauss(k/N,w,c);% design of gauss filter
% plot(filter1);

filter =repmat(filter1,m,1);

filtered_sig = filter.*ty';%point by point multiplication of signal and filter

filtered_sig_inv = ifft(filtered_sig');%original number of points retained

filtered_sig_inv = real(filtered_sig_inv');%taking magnitude of complex result

ecg_filtered = filtered_sig_inv';

%----------------------------PLOT------------------------%
subplot(3,2,1)
plot(t,x(:,1))
title('Original ECG in Time domain');
xlabel('Time in seconds');

subplot(3,2,2)
plot(k/N,abs(ty'),'.-')
title('FFT of ECG');
xlabel('Frequency');

subplot(3,2,3)
plot(k/N,filter1,'g')
title('Gauss Filter');
xlabel('Frequency');

subplot(3,2,4)
plot(k/N,abs(filtered_sig),'r')
title('Filtered ECG in freq Domain');
xlabel('Frequncy');

subplot(3,2,5)
k=2:(14/404):16;
plot(t,ecg_filtered(:,1))
title('Filtered ECG in Time domain');
xlabel('Time in seconds');
%----------------------------PLOT------------------------%


% P2 = abs(ty/n);
% P1 = P2(1:n/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% 
% Q2 = abs(filtered_sig/n);
% Q1 = Q2(1:n/2+1);
% Q1(2:end-1) = 2*Q1(2:end-1);
% f = Fs*(0:n/2)/n;
% 
% figure;
% subplot 211
% plot(f,P1); 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% 
% subplot 212
% plot(f,Q1); 
% title('Filtered Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
%-------------------------------------------------------------------------%

  function  y = cgauss(x,a,m)
y=exp(-0.5*((x-m)/a).^2);
end