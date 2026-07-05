% 每种用两个循环来完成
clc;
clear;
v=[2 5;5 8;8 20;20 23;23 27;27 45];
h=[40 40 40 40 40 240];
%  射线路径追踪h-X
figure(1);
for A=15:1:40
    [sz,ray,tp,xp,px,tao]=rayrayTrue(v,h,A);
    scatter(ray(:,1),ray(:,2),sz,'LineWidth',0.1,'MarkerFaceColor','k','MarkerEdgeColor','k');
%     Fun_ScatterChanging(ray(:,1),ray(:,2),linspace(2,10,length(ray)))
    hold on
end

for A=7:0.2:15
    [sz,ray,tp,xp,px,tao]=rayrayTrue(v,h,A);
    scatter(ray(:,1),ray(:,2),sz,'LineWidth',0.1,'MarkerFaceColor','k','MarkerEdgeColor','k');
%     Fun_ScatterChanging(ray(:,1),ray(:,2),linspace(2,10,length(ray)))

    hold on
end

defaultAxes;
set(gca,'YDir','reverse');
xlabel("距离")
ylabel("深度");
title('射线追踪图像')
set(figure(1),'color','w')
%%
% 走时曲线T-X
figure(2);
for A=15:1:40
    [sz,ray,tp,xp,px,tao]=rayrayTrue(v,h,A);
    scatter(xp,tp,'LineWidth',0.1,'MarkerFaceColor',[0.4941 0.1843 0.5569],'MarkerEdgeColor','r');
    hold on
end
for A=7:0.2:15
    [sz,ray,tp,xp,px,tao]=rayrayTrue(v,h,A);
    scatter(xp,tp,'LineWidth',0.1,'MarkerFaceColor',[0.4941 0.1843 0.5569],'MarkerEdgeColor','r');
    hold on
end
defaultAxes;
set(figure(2),'color','w')
xlabel('x');
ylabel('T');
title('走时曲线T-X')

% 速度分布V-h
figure(3);
rayrayspeed_depth(v,h)
set(figure(3),'color','w')
xlabel("速度");
ylabel("深度");
title("速度分布图");


% 射线参数P-X
figure(4);
for A=15:1:40
    [sz,ray,tp,xp,px,tao]=rayrayTrue(v,h,A);
    scatter(xp,px,'LineWidth',0.1,'MarkerFaceColor',[1 0.0745 0.6510],'MarkerEdgeColor','m');
    hold on
end
for A=7:0.2:15
    [sz,ray,tp,xp,px,tao]=rayrayTrue(v,h,A);
    scatter(xp,px,'LineWidth',0.1,'MarkerFaceColor',[1 0.0745 0.6510],'MarkerEdgeColor','m');
    hold on
end
defaultAxes;
set(figure(4),'color','w')
xlabel('x');
ylabel('P');
title('射线参数曲线P-X')

%  截距tao-P
figure(5);
for A=15:1:40
    [sz,ray,tp,xp,px,tao]=rayrayTrue(v,h,A);
    scatter(px,tao,'LineWidth',0.1,'MarkerFaceColor',[0,1,1],'MarkerEdgeColor','r');
    hold on
end
for A=7:0.2:15
    [sz,ray,tp,xp,px,tao]=rayrayTrue(v,h,A);
    scatter(px,tao,'LineWidth',0.1,'MarkerFaceColor',[0,1,1],'MarkerEdgeColor','r');
    hold on
end
defaultAxes;
set(figure(5),'color','w')
xlabel('p');
ylabel('tao');
title('截距曲线tao-P')


