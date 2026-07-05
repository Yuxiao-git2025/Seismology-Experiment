% 计算反射序列公式
function [ t, Amp ]=Reflector_Series(V,rho,h,t0,tlen,dt)
  t=t0:dt:tlen;
  Nlayer=length(h);
  Amp=zeros(size(t));
  sumt=0;
  Amp0=1;
  for i=1:Nlayer
      sumt=sumt+2*h(i)/V(i);
      [r1,t1]=Coffe_of_RT(V(i),rho(i),V(i+1),rho(i+1));
      [~,t2]=Coffe_of_RT(V(i+1),rho(i+1),V(i),rho(i));
      k=floor(sumt/dt);
      if k<length(t)
          Amp(k)=Amp0*r1;
      end
      Amp0=Amp0*t1*t2;
  end
end
