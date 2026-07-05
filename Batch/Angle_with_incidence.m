clc;
clear;
close all
% Given data-------------------
Vp1=6.8; Vp2=8.0;
Vs1=3.9; Vs2=4.6;

%------------------------------
% To find the Critical angle of p incidence
% When the Transmitted P Waves arrive critical angel
% There will be a relationship that p=sin(ipI_c)/Vp1=1/Vp2
ipI_p_p=asind(Vp1/Vp2);
% The first 'p' is represented the situation when P Waves incident
% The second 'p'is represented when will the Transmitted P Waves start to
% fully-reflected or disppear
fprintf('The critical angle for Transmitted P Waves is %6.3f\n',ipI_p_p);

% When the Transmitted S Waves arrive critical angel:
% There will be a relationship that p=sin(ipI_c)/Vp1=1/Vs2;
ipI_p_s=asind(Vp1/Vs2);
fprintf('The critical angle for Transmitted S Waves is %6.3f so it do not exist! \n\n',ipI_p_s);
% As we can see that the critical angle for Transmitted S Waves is not
% exist because it is 90;

%------------------------------
%p waves incidence:
% Snell law is:
% p=sin(ipI)/Vp1=sin(ipR)/Vp1=sin(isR)/Vs1=sin(ipT)/Vp2=sin(isT)/Vs2;
%for ipI is the incidence wave,ipR is the reflected wave,ipT is the
%transmitted wave;

n=360;
ipI=linspace(0,90,n);
% 水平慢度(射线参数)
p=sind(ipI)/Vp1;
% ipR=ipI;
% ipT=asind(Vp2/Vp1*sind(ipI))=asind(Vp2*p);
% isR=asind(Vs1/vp1*sind(ipI))=asind(Vs1*p);
% isT=asind(Vs2/Vp1*sind(ipI))=asind(Vs2*p);

figure(1)
set(figure(1),'color','white')
subplot(2,2,1)
ipR=ipI;
plot(ipI,ipR,'LineWidth',2.5);
defaultAxes;
title('Reflected P Waves Angle varies with Incidence');
legend('Reflected P Waves');
xlim([0,90]);
ylim([0,90]);
xlabel('incidence angle');
ylabel('emergency angle')

subplot(2,2,2)
ipI_TransP=linspace(0,ipI_p_p,300);
p_transP=sind(ipI_TransP)/Vp1;
ipT_transP=asind(Vp2*p_transP);
plot(ipI_TransP,ipT_transP,'LineWidth',2.5);
title('Transmitted P Waves Angle varies with Incidence');
legend('Transmitted P Waves');
defaultAxes;
xlim([0,90]);
ylim([0,90]);
xlabel('incidence angle');
ylabel('emergency angle')
hold on
xline(ipI_p_p,'LineWidth',2.5,'Color','c');


subplot(2,2,3)
isR=asind(Vs1*p);
plot(ipI,isR,'LineWidth',2.5,'LineStyle','--','Color','m');
title('Reflected S Waves Angle varies with Incidence');
legend('Reflected S Waves');
defaultAxes;
xlim([0,90]);
ylim([0,90]);
xlabel('incidence angle');
ylabel('emergency angle')

subplot(2,2,4)
isT=asind(Vs2*p);
plot(ipI,isT,'LineWidth',2.5,'LineStyle','--','Color','m');
title('Transmitted S Waves Angle varies with Incidence');
legend('Transmitted S Waves');
defaultAxes;
xlim([0,90]);
ylim([0,90]);
xlabel('incidence angle');
ylabel('emergency angle')



%% S waves incidence:
%------------------------------
% To find the critical angle for S incidence:

% When the Transmitted P Waves arrive the critical angle
% There will be relationship that ps=sin(isI_c)/Vs1=1/Vp2
isI_s_p=asind(Vs1/Vp2);
fprintf('The critical angle for Transmitted P Waves is %6.3f\n',isI_s_p');

% When the Transmitted S Waves arrive the critical angle
% Similarly,it can be expressed as ps=sin(isI_c)/Vs1=1/Vs2
isI_s_s=asind(Vs1/Vs2);
fprintf('The critical angle for Transmitted S Waves is %6.3f\n',isI_s_s');

% When the Reflected P Waves arrive the critical angle
% There will be a relationship that ps=sin(isI_c)/Vs1=1/Vp1;
isI_s_pp=asind(Vs1/Vp1);
fprintf('The critical angle for Reflected P Waves is %6.3f\n',isI_s_pp');


%------------------------------
% Snell law is:
% ps=sin(isI)/Vs1=sin(ipR)/Vp1=sin(isR)/Vs1=sin(ipT)/Vp2=sin(isT)/Vs2;
n=360;
isI=linspace(0,90,n);
% 水平慢度(射线参数)
ps=sind(isI)/Vs1;

figure(2)
set(figure(2),'color','white')
subplot(2,2,1)
isR=isI;
plot(isI,isR,'LineWidth',2.5,'Color','m','LineStyle','--');
defaultAxes;
title('Reflected S Waves Angle varies with Incidence');
legend('reflected S Waves');
xlim([0,90]);
ylim([0,90]);
xlabel('incidence angle');
ylabel('emergency angle')

subplot(2,2,2)
isI_RefP=linspace(0,isI_s_pp,300);
p_RefP=sind(isI_RefP)/Vs1;
ipR_RefP=asind(Vp1*p_RefP);
plot(isI_RefP,ipR_RefP,'LineWidth',2.5);
defaultAxes;
title('Reflected P Waves Angle varies with Incidence');
legend('reflected P Waves');
xlim([0,90]);
ylim([0,90]);
xlabel('incidence angle');
ylabel('emergency angle');
hold on
xline(isI_s_pp,'LineWidth',2.5,'Color','c','LineStyle','-');


subplot(2,2,3)
isI_transS=linspace(0,isI_s_s,300);
p_transS=sind(isI_transS)/Vs1;
isT_transS=asind(Vs2*p_transS);
plot(isI_transS,isT_transS,'LineWidth',2.5,'Color','m','LineStyle','--');
defaultAxes;
title('Transmitted S Waves Angle varies with Incidence');
legend('Transmitted S Waves');
xlim([0,90]);
ylim([0,90]);
xlabel('incidence angle');
ylabel('emergency angle');
hold on
xline(isI_s_s,'LineWidth',2.5,'Color','c','LineStyle','--');



subplot(2,2,4)
isI_transP=linspace(0,isI_s_p,300);
p_transP=sind(isI_transP)/Vs1;
ipT_transP=asind(Vp2*p_transP);
plot(isI_transP,ipT_transP,'LineWidth',2.5);
defaultAxes;
title('Transmitted P Waves Angle varies with Incidence');
legend('Transmitted P Waves');
xlim([0,90]);
ylim([0,90]);
xlabel('incidence angle');
ylabel('emergency angle');
hold on
xline(isI_s_p,'LineWidth',2.5,'Color','c');
