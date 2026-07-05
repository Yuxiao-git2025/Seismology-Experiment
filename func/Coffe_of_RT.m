function [Refle_coffe,Trans_coffe]=Coffe_of_RT(V1,rho1,V2,rho2)
   
   Refle_coffe=(rho1*V1-rho2*V2)/(rho1*V1+rho2*V2);
   Trans_coffe=(2*rho1*V1)/(rho1*V1+rho2*V2);
end