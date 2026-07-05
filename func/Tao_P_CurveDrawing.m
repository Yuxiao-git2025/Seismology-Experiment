function Tao_P_CurveDrawing(V0,V1,H0)
% for V0 is the current velocity ;While the V1 is the next floor velocity
% H0 is the current depth
p=0:1/(V0*360):1/V0;
tao=2*sqrt(1/V0^2-p.^2)*H0;
figure;
plot(p,tao,'LineWidth',2.5,'Color','b')
title('τ-p曲线')

xlabel('p')
ylabel('τ')

% 将p轴设为top
set(gca,'XAxisLocation','top');
% 将τ坐标标注反转
set(gca,'YDir','reverse');



hold on
maxt=max(tao);
plot(0,maxt,'o','MarkerSize',14,'MarkerFaceColor','m');
text(1/(3*maxt),maxt,'\bf{零偏移距点 (p=0)} \fontsize{15} ', 'FontSize', 15,'Color','m')

hold on
maxp=max(p);
plot(maxp,0,'o','MarkerSize',14,'MarkerFaceColor','r')
text(maxp,5*maxp,'\bf{直达波 (p=1/V0)} \fontsize{15} ', 'FontSize', 15,'Color','r')

hold on
% When the Refracted Waves arrive
p1=1/V1;
tao1=2*sqrt(1/V0^2-p1.^2)*H0;
plot(p1,tao1,'o','MarkerSize',14,'MarkerFaceColor','c')
text(p1,(2/3)*maxt,'\bf{折射波 (p1=1/V1)} \fontsize{15} ', 'FontSize', 15,'Color','c')

hold on
line([0 1.5*maxp],[0 0],'color','k','LineWidth',3);
line([0 0],[0 1.5*maxt],'color','k','LineWidth',3);
axis tight
defaultAxes;
end