function [] = peakFinder(data)

 L = 0; % Largest peak, L initally set 0
 for i = 1:length(data)
     if(data(1,i) > L)
         L = data(1,i);  %Update L
         temp1 = i;
     end
     %disp(temp)
 end
 
 temp = temp1;
 while (data(1,temp)>0)
     temp = temp+1;
 end
 
 SL = 0; %Second Largest peak initially 0
 for i = temp:length(data)
     if(data(1,i)>SL && data(1,i)<L)
         SL = data(1,i);    %update Second Largest peak
         temp2 = i;
     end
     %disp(temp2)
 end
 
% data(L)
 
 disp('Largest peak : ');
 disp(L); disp(temp1);
 disp('Second peak: ');
 disp(SL);disp(temp2);
 
 difference = ((temp2- temp1)/length(data))*1000;
 disp(difference);
 
 
  