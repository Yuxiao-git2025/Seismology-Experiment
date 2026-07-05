function defaultAxes
ax=gca;
hold on;
box on;
ax.XGrid='on';
ax.YGrid='on';
ax.LineWidth=1.2;
ax.GridLineStyle=':';
%ax.FontName='Cambria';
ax.FontSize=18;
ax.GridAlpha=.4;
set(gcf,'color','w');
end