function rayrayspeed_depth(v,h)
hold on
dz=0.1;
dep_all_i=0;
k=1;
N=length(h);

%给定角度A

    
    for i = 1:N
        
        v1 = v(i, 1);
        v2 = v(i, 2);
        nz = floor(h(i)/dz) ;
        dv = (v2-v1)/nz;


            for j = 1:nz
        
                     depth = dep_all_i + j*dz;
                     v_i=v1 +(j-1)*dv;
                     %速度模型：
                     V(k)=v_i;
                     D(k)=depth;
                     k=k+1;
                     
        
            end

        dep_all_i= dep_all_i + h(i);

    end
    plot(V,D,'o','MarkerSize',1,'Color','m','LineWidth',2.2)
    hold on
    set(gca,'YDir','reverse');
    defaultAxes;
end
