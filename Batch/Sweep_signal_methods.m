% Created by Xi'ao Yu
%----------------------------------
% Draw sweep signal
clc;
close all
clear;
f1=1;
f2=15;
T=5;
dt=0.0025;
figure(1)
set(figure(1),'color','w')
t=0:dt:T;
wt=cos(2*pi*(f1*t+(f2-f1)*t.^2./(2*T)));
plot(t,wt,'LineWidth',1.5,'Color','k');
title('sweep signal');
hold on
line([0 0],[-1/2 1/2],'linewidth',2,'color','b');
quiver(0,0,T+1,0,'linewidth',2,'color','b');
ylim([-2 2])
xlim([-1 T+1])
xlabel('t');
ylabel('w(t)')
defaultAxes;

% ----------------------------------
% Obtain Klauder Wavelet from Self-Correlation：
[Rwt,lags]=xcorr(wt,wt,'normalized');
figure(2)
set(figure(2),'color','w')
lags=lags*dt;
plot(lags,Rwt,'LineWidth',1.5);
xlabel('t');
title('Klauder Wavelet')
defaultAxes;


% ----------------------------------
% Calculate the reflector series
% dt = 0.0025;
V=[8.3 7.8 8.6 7.3];
rho=[4.1 3.5 4.6 4.0];
h=[2 3 2];
tlen=2;
t0=0;


figure(3)
set(figure(3),'color','w')
[ tt, Amp ]=Reflector_Series(V,rho,h,t0,tlen,dt);
plot(tt,Amp,'LineWidth',2.2,'Color',[0.494 0.184 0.556])
defaultAxes;
xlabel('t');
ylabel('Amplitude');
hold on
line([0 tlen],[0 0],'LineWidth',2,'color',[0.85 0.325 0.098]);
ylim([-0.2 0.2])
title('Reflector Series')

%%
% ----------------------------------
% Convolution to obtain synthetic seismic records: st=wt*Amp
t=0:dt:T;
n=length(t)+length(tt)-1; %6+3-1=8
tu=0:dt:dt*(n-1);         
st=conv(wt,Amp);          %0-7长度为8
% st=custom_conv(wt,Amp);
figure(4)
set(figure(4),'color','w')
plot(tu,st,'LineWidth',2,'Color',[0.74118 0.71765 0.41961])
xlabel('t');
ylabel('Convolution S(t)');
title('合成地震记录S(t)');
defaultAxes;

%%
% ----------------------------------
% Deconvolution yields a Reflector series:
dst=deconv(st,wt);  % Deconvolution
figure(5)
set(figure(5),'color','w')
plot(tt,dst,'LineWidth',2.2,'Color',[0.11765 0.56471 1]);
xlabel('t');
ylabel('Amplitude of deconvolution')
defaultAxes;
hold on
line([0 tlen],[0 0],'LineWidth',2,'color',[0.85 0.325 0.098]);
title('Recovery of Reflector Series')



% ----------------------------------
% Recovering the Reflector series using Cross-Correlation 
% and comparing it with the previous one 
figure(6)
set(figure(6),'color','w')
plot(tt,dst,'LineWidth',2.2,'Color',[0.11765 0.56471 1]);
m=length(t)+length(tt)-1;
% Extend the array w(t) to be the same as S(t)
wt_Add=[];
for i=1:length(wt)
    wt_Add(i)=wt(i);
end
for j=length(wt):m
    wt_Add(j)=0;
end

[R_recover,lags_recover]=xcorr(st,wt_Add,'normalized');
lags_recover=lags_recover*dt;
R_recover=R_recover/3.8;    

xlim([0 tlen]);
    
hold on
plot(lags_recover,R_recover,'LineWidth',1,'Color',[0.7176 0.2745 1]);
xlabel('t');
ylabel('Amplitude')
title('Comparision of R(t) with S(t)');
legend('The reflector series R(t) of deconvolution', ...
    'Composited seismic records after Cross-correlation','Location','northwest')
defaultAxes;



