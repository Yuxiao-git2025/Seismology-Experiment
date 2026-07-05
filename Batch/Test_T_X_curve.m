clc;
close all
%------------------------------------
h=[40 50 60 80];
V=[6.3 6.8 7.5 8.2];
N=length(V);
color=[
0.74118 0.71765 0.41961;
0.85 0.325 0.098;
0.929 0.694 0.125;
0.494 0.184 0.556;
];
figure(1)
set(figure(1),'color','white')
sumxp=0;
sumTp=0;
%-------------------------------------
% p=sin(i0)/v0=sin(ij)/Vj;
% 实际走时：
for i0=0:2:50
   sumxp=0;
   sumTp=0;  % 由于是画一组数据，第二次的时候应重置该值
    for j=1:N
            %------------------------------
            p=sind(i0)/V(1);
            xp(j)=2.*h(j).*p.*V(j)./sqrt(1-V(j).^2.*p.^2);
            sumxp=sumxp+xp(j);
           
            %------------------------------
            Tp(j)=2.*h(j)./(V(j).*sqrt(1-V(j).^2.*p.^2));
            sumTp=sumTp+Tp(j);

            
            plot(sumxp,sumTp,'o','LineWidth',2,'MarkerSize',10,'Color',color(j,:))
            hold on
            %------------------------------
            if sumxp>400
                break;
            end
    end
end


%-------------------------------------
% 近似走时：T(x)^2=x^2/Vn^2+tn^2;
sumtn=0;
sumVn_coff1=0;
sumVn_coff2=0;

for i=1:N
          %------------------------------  
            tn=2.*h(i)./V(i);
            sumtn=sumtn+tn;
          %------------------------------  
            Vn_coff1=V(i).^2.*h(i)./V(i);
            Vn_coff2=h(i)./V(i);
        
            sumVn_coff1=sumVn_coff1+Vn_coff1;
            sumVn_coff2=sumVn_coff2+Vn_coff2;
         
            sumVn=sqrt(sumVn_coff1./sumVn_coff2);
           %------------------------------  
            
            Xlim=[xp(1) xp(1)+xp(2) xp(1)+xp(2)+xp(3) xp(1)+xp(2)+xp(3)+xp(4)];
            x=0:Xlim(i);
            T=sqrt((x.^2)./(sumVn.^2)+sumtn.^2);          
            plot(x,T,'LineWidth',2,'Color',color(i,:))
            hold on
            
           
end

defaultAxes;
title('True Travel times(Dots) VS Approximated times(Curves)')
xlabel('Distance/km');
ylabel('Travel Times/s');


