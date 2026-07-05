clc;
sigma=[2,1,3;1,-1,-2;3,-2,5];

%  y-z平面的法向量为:[1 0 0]
n1=[1 0 0]';
[T1,MT1,dir_MT1]=Traction_method(sigma,n1);
fprintf('The first answer is \n');
fprintf('The Traction are respectively \tT1=%5.2f T2=%5.2f T3=%5.2f\n',T1);
fprintf(['Three pincipal stress are respectively \tsigma1=%5.3f ' ...
    'sigma2=%5.3f sigma3=%5.3f\n'],MT1);
fprintf('The directions of pincipal axis of stress are\n');
fprintf(' \t %5.3f %5.3f %5.3f\n ',dir_MT1);
fprintf('And one horizontal row corresponds to one data\n\n');
%n=[3,-1,2]时：
n_data=[3,1,2];
%归一化数据
s=sum(power(n_data,2));
nn=n_data/sqrt(s);
n2=nn';
[T2,MT2,dir_MT2]=Traction_method(sigma,n2);
fprintf('The second answer is \n');
fprintf('The Traction are respectively \tT1=%5.2f T2=%5.2f T3=%5.2f\n',T2);
fprintf(['Three pincipal stress are respectively \tsigma1=%5.3f ' ...
    'sigma2=%5.3f sigma3=%5.3f\n'],MT2);
fprintf('The directions of pincipal axis of stress are\n');
fprintf(' \t %5.3f %5.3f %5.3f\n ',dir_MT2);
fprintf('And one horizontal row corresponds to one data\n\n');
%可知，不同的平面虽然有不同的法向量n，但是给定应力张量时，其主应力，应力主轴是确定的；


