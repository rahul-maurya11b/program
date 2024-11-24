t=0:0.00001:1;
y=87.05*exp(-0.3623*((t.^2)/2)+21.55*t);
plot(t,y)


% polynomial
a=[32.866382,-0.987768,0.0864,-0.005963,0.000171,0.000002];
b=[11.4223906,-0.3986533,0.0257024,-0.001359,0.0000374,-0.0000004];
g=a-b;

y=87.05*exp(g(1)*t + g(2)*(t.^2)/2+g(3)*(t.^3)/3+g(4)*(t.^4)/4+g(5)*(t.^5)/5+g(6)*(t.^6)/6);
% also do birth rate and death rate are linear function of time
% plot(t,y);

% Now b and d are linear function of population 

% expression goes as :
% 
alpha0=55.30;
alpha1=-2.713;
beta0=15.57;
beta1=-0.0615;
alpha=alpha0-beta0;
beta=beta1-alpha1;
y0=87.05;
y1=y0./((1-(beta*y0/alpha)).*exp(-alpha*t)+(beta/alpha)*y0);
plot(t,y1);


