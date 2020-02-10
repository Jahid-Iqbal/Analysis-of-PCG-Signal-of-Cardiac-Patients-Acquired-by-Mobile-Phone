Zfica = fastICA(Zmixed,5);
%--------------------------------------------------------------------------
% Plot results
%--------------------------------------------------------------------------
cm = hsv(max([3, r, d]));
%cm = linspecer(max([3, r, d]));

figure();

% Truth
subplot(3,1,1);
for i = 1:3
    plot(Znoisy(i,:),'-','Color',cm(i,:)); hold on;
end
title('True signals');
axis tight;

% Observations
subplot(3,1,2);
for i = 1:3
    plot(Zmixed(i,:),'-','Color',cm(i,:)); hold on;
end
title('Observed mixed signals');
axis tight;

% Fast ICA
subplot(3,1,3);
for i = 1:5
    plot(Zfica(i,:),'-','Color',cm(i,:)); hold on;
end
title('Independent components [Fast ICA]');
axis tight;