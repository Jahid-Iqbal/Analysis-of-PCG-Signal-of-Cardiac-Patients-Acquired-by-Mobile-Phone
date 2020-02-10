load sumsin 
[c,l] = wavedec(sumsin,4,'db2');
approx = appcoef(c,l,'db2');
[cd1,cd2,cd3] = detcoef(c,l,[1 2 3]);

%-------------------Plot----------------%
subplot(5,1,1)
plot(sumsin)
title('Signal')
subplot(5,1,2)
plot(approx)
title('Approximation Coefficients')
%subplot(5,1,4)
%plot(cd4)
%title('Level 4 Detail Coefficients')
subplot(5,1,3)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(5,1,4)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(5,1,5)
plot(cd1)
title('Level 1 Detail Coefficients')