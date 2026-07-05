function [T,MT,dir_MT]=Traction_method(sigma,n)

%T is represented traction
%MT is represented pincipal stress
%dir_MT reprensented the directions of pincipal axis of stress
%The tress tensor is given by [2,1,3;1,-1,-2;3,-2,5];
%input a colomn vector n,then return a traction;

T=sigma * n;

[V,D]=eig(sigma);
H=diag(D);
MT=[H(1) H(2) H(3)];


dir_MT1=[V(1,1) V(2,1) V(3,1)];
dir_MT2=[V(1,2) V(2,2) V(3,2)];
dir_MT3=[V(1,3) V(2,3) V(3,3)];
dir_MT=[dir_MT1 dir_MT2 dir_MT3]';

end