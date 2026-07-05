function [sz,ray,tp,xp,px,tao]=rayrayTrue(v,h,A)

dz=0.1;
dep_all_i=0;
ray(1,1)=0;
ray(1,2)=0;
N=length(h);
x_i_copy(1)=0;
k=1;
Tp(1)=0;
%给定角度A

        dmax=Depth_Max(v,h,A);
        p = sind(A)/v(1,1);
        px=p;  %每一个入射角有一个tp,xp,px,tao值
    %----------------------------------------------
    for i = 1:N
        
        v1 = v(i, 1);
        v2 = v(i, 2);
        nz = floor(h(i)/dz) ;
        dv = (v2-v1)/nz;
        
        for j = 1:nz
            depth = dep_all_i + j*dz;
            v_i=v1 +(j-1)*dv;
            
            if (depth<=dmax)
                eta = sqrt(1/v_i/v_i-p*p);
                x_i =dz*p/eta;
                x_i_copy(k)=x_i;              
                ray(k+1,1)=ray(k,1)+x_i;  %对每一步进行存储，记成一个两列数组
                ray(k+1,2)=ray(k,2)+dz;   %第一组代表横向距离x，第二组代表纵向深度h

    %----------------------------------------------
    %T-X的T：
                T=sqrt(dz*dz+ x_i*x_i)/v_i;  %同理，对时间T进行存储成一维向量
                T_i_copy(k)=T;
                Tp(k+1)=Tp(k)+T;

                k=k+1;          % ray的点的长度比x_i多一
                
            else 
                break;                
            end             
        end                
                dep_all_i= dep_all_i + h(i);
    end    

    k=length(ray);  
    m=length(ray)-1;
    for i=m:-1:1
        ray(k+1,1)=ray(k,1)+x_i_copy(i);
        ray(k+1,2)=ray(k,2)-dz;
        Tp(k+1)=Tp(k)+T_i_copy(i);    %每一段的时间Tp都表示了出来
        k=k+1;
    end
    %----------------------------------------------
    sz = linspace(2,2,length(ray));  %sz为scatter里面的参数
    %P-X图：
    % 找到累计值tp,xp，其实就是数组的最大值
    tp= max(Tp);
    xp=max(ray(:,1));
    %----------------------------------------------
    %截距tao
    tao=tp-px*xp;
    
end
