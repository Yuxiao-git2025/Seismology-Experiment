clc;
clear;
% ----------------------------
alpha1=13.7;
beta1=7.2;
rho1=5.5;
alpha2=8;
beta2=0;
rho2=9.9;
Wavetype=input('please input the wavetype\n','s');
Traveltype=input('please input the Traveltype\n','s');

[R12_dp,T12_dp,ERI_dp,ETI_dp]=Refle_Trans_Coeff(alpha1,alpha2,beta1,beta2,rho1,rho2,Wavetype,Traveltype);
fprintf('Refle_Coeff =%5.4f\n',R12_dp);
fprintf('Trans_Coeff =%5.4f\n',T12_dp);
fprintf('Refle_ratio =%5.4f\n',ERI_dp);
fprintf('Trans_ratio =%5.4f\n\n',ETI_dp);



