function cos_plot(w,t,k,x)
y=cos(w*t-k*x);
plot(y,'LineWidth',2.5,'Color',[1.0000    0.4118    0.1608]);
defaultAxes;
end