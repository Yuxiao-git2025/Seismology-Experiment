clc;
close all
X=[9 8 7 6 5 4]';
x=[ones(6,1),X];
Y=[2 27 335 3439 40377 304686]';
N=log10(Y);
k=regress(N,x);
figure(1)

%G-R关系回归方程建立
z=k(1)+k(2)*X; 
fprintf('回归方程为：lgN=%4.2f+(%4.2f)*m \n',k(1),k(2))
a=k(1);
b=-k(2);
fprintf('参数a=%4.2f b=%4.2f',a,b);

% %频度-震级作图
plot(X,N,'r+',X,z,'b','LineWidth',2.5,'MarkerSize',20);
grid;
xlabel('震级m');
ylabel('个数N(N=log10(Y))');
title('第一题')

legend('统计点','G-R回归方程')
hold on

defaultAxes;



