clc;close all
clear;
%-------------------
alpha1=6.8;
alpha2=8;
beta1=3.9;
beta2=4.6;
%--------------------
% Input What you want :
disp('Max Angle is setting : Amax=80');
disp('Numbers of Incidence P Waves is setting : deltaA=6');

% setting six numbers of Curves
Amax=80;  % sine of arguments in degress
deltaA=6;
defaultAxes;
% Using the function:
Ray_Paths(alpha1,alpha2,beta1,beta2,deltaA,Amax)

