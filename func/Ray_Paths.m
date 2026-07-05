function Ray_Paths(alpha1,alpha2,beta1,beta2,deltaA,Amax)
 % p=sin(ipI)/alpha1=sin(ipR)/alpha1=sin(isR)/beta1=sin(ipT)/alpha2=sin(isT)/beta2; 
 %For Given Dot (X0,Y0)
 Amin=0;
 X0=0;Y0=2;
 figure(1)

 plot(X0,Y0,'o','MarkerSize',12,'MarkerFaceColor','r');
 hold on
 text(X0+1,Y0+0.2,'  Exciting source  ','FontSize',18) 
 ipI=linspace(Amin,Amax,deltaA);
 % Known as:
 p=sind(ipI)/alpha1;
 ipR=ipI;
 ipT=asind(alpha2*p);
 isR=asind(beta1*p);
 isT=asind(beta2*p);

for i=1:deltaA
    % Incidence P Waves
        ipI_i=ipI(i);
        Xi=Y0*tand(ipI_i);        
        line([X0 Xi],[Y0 0],'linewidth',1.6,'color',[0.18431 0.3098 0.3098])
        hold on
    % Reflected P Waves
        ipR_i=ipR(i);
        XR=Y0*tand(ipR_i);  % XR is using to find Crossing Dots
        v=quiver(XR,0,XR,Y0+0.2,'LineWidth',1.5,'Color','c');
        set(v,'maxheadsize',0.68-0.1*i)
        hold on
    % Transmitted P Waves
    % 注意：角度大于临界角后发生全发射了
        ipT_i=ipT(i);      
        PT=Y0*tand(ipT_i);
        h=quiver(XR,0,PT,-(Y0+0.2),'LineWidth',1.5,'Color','m');
        set(h,'maxheadsize',0.68-0.1*i)
        hold on
    
    % Refleted S Waves
        isR_i=isR(i);      
        SR=Y0*tand(isR_i);
        g=quiver(XR,0,SR,Y0+0.2,'LineWidth',1.5,'Color',[0.85 0.325 0.098],'LineStyle','--');
        set(g,'maxheadsize',0.8-0.1*i)
        hold on
    % Plot the Dots that cross boundary:
        hold on    
        plot(Xi,0,'o','MarkerSize',8,'MarkerFaceColor',[0.635 0.078 0.184]);
    % Transmitted S Waves
        isT_i=isT(i);      
        ST=Y0*tand(isT_i);
        if isT_i==0
            continue
        end
        f=quiver(XR,0,ST,-(Y0+0.2),'LineWidth',1.5,'Color',[0.74118 0.71765 0.41961],'LineStyle','--');
        set(f,'maxheadsize',0.8-0.1*i)


end
        ylim([-3*Y0/2 3*Y0/2]);
        set(figure(1),'color','white')
        title('P Waves impinges on the Solid-Solid interface');
        xlabel('X');
        ylabel('Y')
        annotation('textarrow',[0.81 0.87],[0.47 0.47],'String','incident P','linewidth', ...
            2,'Color',[0.184 0.3098 0.3098],'FontSize',15) 
        annotation('textarrow',[0.81 0.87],[0.41 0.41],'String','Reflected P','linewidth', ...
            2,'Color','c','FontSize',15) 
        annotation('textarrow',[0.81 0.87],[0.35 0.35],'String','Transmitted P','linewidth', ...
            2,'Color','m','FontSize',15)
        annotation('textarrow',[0.81 0.87],[0.29 0.29],'String','Refleted SV','linewidth', ...
            2,'Color',[0.85 0.325 0.098],'FontSize',15)
        annotation('textarrow',[0.81 0.87],[0.23 0.23],'String','Transmitted SV','linewidth', ...
            2,'Color',[0.74 0.7176 0.42],'FontSize',15)
     % Draw boundary
        hold on
        line([-2 25],[0 0],'linewidth',1.8,'color',[0.635 0.078 0.184]);
        text(14,0.1,' Solid-Solid Boundary ','FontSize',16) 
end
 
 