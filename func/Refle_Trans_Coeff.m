function [R12,T12,ERI,ETI]=Refle_Trans_Coeff(Vp1,Vp2,Vs1,Vs2,rho1,rho2,Wavetype,Traveltype)
switch Traveltype
    case 'Downgoing'
        disp('This case is Downgoing')
        switch Wavetype
            case 'P'
                
                disp('Withing P Waves')     
                % Calculate Reflection coefficient and Transmittion cofficient
                R12=(rho1*Vp1-rho2*Vp2)/(rho1*Vp1+rho2*Vp2);
                T12=(2*rho1*Vp1)/(rho1*Vp1+rho2*Vp2);
                
                % Calculate energy flux density ratio
                % for ERI is the Reflection flux; ETI is the Transmittion flux
                ERI=R12^2;
                ETI=T12^2*(rho2*Vp2)/(rho1*Vp1);
                
           
    
            case 'S'
                disp('Withing S Waves')
                R12=(rho1*Vs1-rho2*Vs2)/(rho1*Vs1+rho2*Vs2);
                T12=(2*rho1*Vs1)/(rho1*Vs1+rho2*Vs2);
                ERI=R12^2;
                ETI=T12^2*(rho2*Vs2)/(rho1*Vs1);
        end
    case 'Upgoing'
    disp('This case is Upgoing')
        switch Wavetype
             case 'P'
                disp('Withing P Waves')
                R12=(rho2*Vp2-rho1*Vp1)/(rho1*Vp1+rho2*Vp2);
                T12=(2*rho1*Vp2)/(rho1*Vp1+rho2*Vp2);
                ERI=R12^2;
                ETI=T12^2*(rho1*Vp1)/(rho2*Vp2);
    
             case 'S'
                disp('Withing S Waves')
                R12=(rho2*Vs2-rho1*Vs1)/(rho1*Vs1+rho2*Vs2);
                T12=(2*rho1*Vs2)/(rho1*Vs1+rho2*Vs2);
                ERI=R12^2;
                ETI=T12^2*(rho1*Vs1)/(rho2*Vs2);
            
        end

end
end

