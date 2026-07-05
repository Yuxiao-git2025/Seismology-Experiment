%calculate the value of cos(wt-kx)
clc;
close all
clear;
%First Drawing:
subplot(2,2,1)
w=1;k=1;x=1;
t=0:0.1:10;
cos_plot(w,t,k,x)
title('Given t=0~10 w=1;k=1;x=1;');
%Second Drawing:
subplot(2,2,2)
w2=4;k2=1;x2=0;
t2=0:0.1:10;
cos_plot(w2,t2,k2,x2)
title('Given t=0~10 w=4;k=1;x=0;');
%Third Drawing:
t3=0;w3=1;k3=2;
x3=0:0.1:10;
subplot(2,2,3)
cos_plot(w3,t3,k3,x3)
title('Given x=0~10 t=0;w=1;k=2;');
%Fourth Drawing
t4=0;w4=1;k4=4;
x4=0:0.1:10;
subplot(2,2,4)
cos_plot(w4,t4,k4,x4)
title('Given x=0~10 t=0;w=1;k=4;')
set(gcf,'color','w')
