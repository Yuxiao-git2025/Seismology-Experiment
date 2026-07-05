
% -----------------------
minx=input('input minx=');
maxx=input('input max=');
x=minx:0.05:maxx;
y=input('input a funtion (eg.y=2*x.^2 or y=sin(x)+cos(x) \ny=');
N=length(y);

% Colormaps
color=colormap(cool(N));

% Maker size changing with x axis
markerSize=linspace(1,100,length(x));% Marker size

% Color changing with y axis
normy=(y-min(y))./(max(y)-min(y));
coloridx=ceil(1+normy*(N-1));
markerColor=color(coloridx,:);% MarkerFaceColor

scatter(x,y,markerSize,markerColor,'o','filled');
% -----------------------
% Background Color
set(gcf,'Color',[1 1 1])

title('Scatter with Gradient Colors')
xlim([min(x) max(x)])
colormap(color)

clim([min(y),max(y)])
cticks=linspace(min(y),max(y),5);
colorbar('Ticks',cticks,'FontSize',10)

defaultAxes;
