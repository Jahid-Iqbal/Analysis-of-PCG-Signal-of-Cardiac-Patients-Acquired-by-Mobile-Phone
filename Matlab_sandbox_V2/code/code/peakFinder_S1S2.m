function [] = peakFinder_S1S2(data)

 L = 0; % Largest peak, L initally set 0
 for i = 1:length(data)
     if(data(1,i) > L)
         L = data(1,i);  %Update L
         temp1 = i;
     end
     %disp(temp)
 end
 
 SL = 0; % Largest peak, L initally set 0
 for j = floor((length(data)/2)):length(data)
     if(data(1,j) > SL)
         SL = data(1,j);  %Update L
         temp2 = j;
     end
 end
 
 disp('Largest peak : ');
 disp(L); disp(temp1);
 disp('Second peak: ');
 disp(SL);disp(temp2);
 difference = ((temp2- temp1)/length(data))*1000;
 disp(difference);
 t=(temp1/length(data))*1000;
 disp(t)