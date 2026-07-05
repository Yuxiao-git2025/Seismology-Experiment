
%function to find the deepest point for a specific ray 
function dmax = Depth_Max(v, h, A) 
N = length(h);
% for A=7:0.1:15 
p = sind(A)/v(1,1); 
    if (p>0) 
        vmax = 1/p;
    else 
        dmax = -999; 
        return; 
    end 
h_max = -999;
dep_all_i=0; 

for i = 1:N 
    v1 = v(i, 1); 
    v2 = v(i, 2); 
    if  ((vmax) >=v1 && (vmax) <v2)
        h_max = h(i)/(v2-v1)*(vmax-v1);
        break; 
    end 
    dep_all_i= dep_all_i + h(i);
end 

if  (h_max>=0) 
    dmax = dep_all_i+ h_max;
    
else 
    dmax = -999;
end 

end    