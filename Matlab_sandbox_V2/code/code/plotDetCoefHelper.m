function plotDetCoefHelper(f,C,L)
%Copyright 2016 The MathWorks, Inc.
 D = detcoef(C,L,'cells');
% % [cD1, cD2, cD3, cD4, cD5] = detcoef(C,L,[1,2,3,4,5]);
figure; set(gcf,'Position', [402         139        1378         923]);
subplot(8,1,1)
plot(f); axis tight; grid on; title('Original Signal');
subplot(8,1,2) 
h = stem(dyadup(D{1}));
h.ShowBaseLine = 'off';
h.Marker = '.';
h.MarkerSize = 10;
axis tight; grid on; title('Level 1 Details');
subplot(8,1,3)
h = stem(dyadup(dyadup(D{2})));
h.ShowBaseLine = 'off';
h.Marker = '.';
h.MarkerSize = 10;
axis tight; grid on;title('Level 2 Details');
subplot(8,1,4);
h = stem(dyadup(dyadup(dyadup(D{3}))));
h.ShowBaseLine = 'off';
h.Marker = '.';
h.MarkerSize = 10;
axis tight; grid on; title('Level 3 Details');

subplot(8,1,5);
h = stem(dyadup(dyadup(dyadup(dyadup(D{4})))));
h.ShowBaseLine = 'off';
h.Marker = '.';
h.MarkerSize = 10;
axis tight; grid on;title('Level 4 Details');

subplot(8,1,6);
h = stem(dyadup(dyadup(dyadup(dyadup(dyadup(D{5}))))));
h.ShowBaseLine = 'off';
h.Marker = '.';
h.MarkerSize = 10;
axis tight; grid on;title('Level 5 Details');

subplot(8,1,7);
h = stem(dyadup(dyadup(dyadup(dyadup(dyadup(D{6}))))));
h.ShowBaseLine = 'off';
h.Marker = '.';
h.MarkerSize = 10;
axis tight; grid on;title('Level 6 Details');

subplot(8,1,8);
h = stem(dyadup(dyadup(dyadup(dyadup(dyadup(D{7}))))));
h.ShowBaseLine = 'off';
h.Marker = '.';
h.MarkerSize = 10;
axis tight; grid on;title('Level 7 Details');
