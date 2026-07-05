clc;
clear;

%The strain value is given as:
e=[0.26*10^(-6) -0.69*10^(-6) 0;-0.69*10^(-6) 0.92*10^(-6) 0;0 0 0];
%Lame constant is:
lamda=3.1*10^(10);
mu=3.31*10^(10);

sigma_value=strain_stress(e,lamda,mu);
disp('The tensor of stress is');
disp(sigma_value)
