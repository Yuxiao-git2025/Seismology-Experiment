function  MyScatterColorYXA(x,y)
N=length(y);
% Colormaps
color=colormap(cool(N));

% Maker size changing with x axis
markerSize=linspace(1,3,length(x));% Marker size

% Color changing with y axis
normy=(y-min(y))./(max(y)-min(y));
coloridx=ceil(1+normy*(N-1));
markerColor=color(coloridx,:);% MarkerFaceColor

scatter(x,y,markerSize,markerColor,'o','filled');
% -----------------------
% Background Color
set(gcf,'Color',[1 1 1])

xlim([min(x) max(x)])
colormap(color)

clim([min(y),max(y)])
cticks=linspace(min(y),max(y),5);
colorbar('Ticks',cticks,'FontSize',14)

ax=gca;
hold on;
box on
grid on;
ax.XGrid='on';
ax.YGrid='on';
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.LineWidth=2.2;
ax.GridLineStyle=':';
ax.FontName='Cambria';
ax.FontSize=14;
ax.GridAlpha=.5;
end