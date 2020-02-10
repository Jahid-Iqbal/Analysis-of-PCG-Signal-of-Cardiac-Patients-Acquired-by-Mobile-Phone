function [] = peakFinder_FFT(data)
 
N =100; %Only take the first to peak's half.
 peakOne = 0; % Largest peak, L initally set 0
 
 %First peak
 for i = 1:N %%length(data(1:N/2+1)) %% length = 200
     if(data(1,i) > peakOne)
         peakOne = data(1,i);  %Update L
         Lindex = i;
     end
 end
 
%Second peak
for j = Lindex:N
    if(data(j-1) > data(j) && data(j) <= data(j+1) )
        temp1 = j;
        break  %Found the low point after Peak1
    end
end
 

SL = 0; %Second Largest peak initially 0
for k = temp1:N %Start from the low point to find second peak
     if(data(1,k) > SL)
         SL = data(1,k);    %update Second Largest peak
         secondLowestIndex = k;
     end
 end
 
 disp('Largest peak : ');
 disp(peakOne); disp(Lindex);
 disp('Second peak: ');
 disp(SL);disp(secondLowestIndex);
 
 %difference = (temp2- temp1);
 %disp(difference);
 
 
