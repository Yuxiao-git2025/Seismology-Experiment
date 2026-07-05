function [T,MT,dir_MT]=Craft1(sigma,n)

%T is represented traction
%MT is represented pincipal stress
%dir_MT reprensented the directions of pincipal axis of stress
%The tress tensor is given by [2,1,3;1,-1,-2;3,-2,5];
%input a colomn vector n,then return a traction;

T=sigma * n;

N=length(sigma);
[V,D]=eig(sigma);
H=diag(D);
for i=1:N
MT(i)=H(i);
end

for i=1:N
  for j=1:N    
    dir_MT(i,j)=V(j,i);
  end
end

end