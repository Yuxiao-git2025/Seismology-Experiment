% For given the data:
% '青藏高原' Hq=60; V0=6.3;
% '四川盆地' Hs=40; V0=6.3;
% '地幔' Hm=2900; V1=10;
% '外核' v2=7.8;
%-------------------------------------------------------
% Using the τ-p formula : τ(p)=2*sqrt(1/V0^2-1/V1^2)*H0; η=sqrt(u^2-p^2);
clc;
close all
clear;
V0=6.3;
V1=10;
v2=7.8;
Hq=60; 
Hs=40; 
Hm=2900; 
figure;
rectangle('Position', [0,0,20,2], 'FaceColor', 'r');
rectangle('Position',[0,2,20,6],'FaceColor',[0 0.4470 0.7410]);
rectangle('Position',[0,5.5,10,7],'FaceColor','y');
rectangle('Position',[10,6,10,5],'FaceColor',[0.466 0.674 0.188]);
axis off
axis tight
text(8,1,'\bf{外核Vp=7.8km/s} \fontsize{14} ', 'FontSize', 16,'Color','k')
text(8,5,'\bf{地幔:V=10km/s} \fontsize{14} ', 'FontSize', 16,'Color','k')
text(8,4,'\bf{H=2900km} \fontsize{14} ', 'FontSize', 16,'Color','k')
text(8,3,'\bf{V=10km/s} \fontsize{14} ', 'FontSize', 16,'Color','k')
text(3,9,'\bf{青藏高原：H=60KM  Vp=6.3km/s} \fontsize{14} ', 'FontSize', 16,'Color','k')
text(12,9,'\bf{四川盆地: H=40KM  Vp=6.3km/s} \fontsize{14} ', 'FontSize', 16,'Color','k')
title('The picture of Quentions');
defaultAxes;
set(gcf,'position',[200,50,1100,700]);
% ------------------------
% 青藏高原的τ-p曲线
Tao_P_CurveDrawing(V0,V1,Hq);
title('青藏高原的τ-p曲线');
% 四川盆地的τ-p曲线
Tao_P_CurveDrawing(V0,V1,Hs);
title('四川盆地的τ-p曲线');



