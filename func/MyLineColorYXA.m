function MyLineColorYXA(y)

%Set Colormap.
N = length(y);
%color = hsv(N);
color = jet(N);
%color = dipCM(76,N); %Custom
colormap(color);

% Plot sample data.


normy = (y - min(y)) ./ (max(y) - min(y));
coloridx = ceil(1+normy*(N-1));

for k = 1:N-1
    plot(k:k+1, y(k:k+1),'LineWidth',3,'Color',color(coloridx(k),:))
hold on
end
colorbar
caption = sprintf('Values varies along y-axis.' );
title(caption, 'FontSize', 12);

set(gca,'FontName','Times New Roman','FontSize',12)

end