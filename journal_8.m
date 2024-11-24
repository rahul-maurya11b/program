% % Q1: for demand and supply as constant
% 
h=1;
x=0:h:10;
ey=zeros(size(x));
ry=zeros(size(x));
ey(1)=15;
ry(1)=15;
d=1065.4;
s=1047;
k=0.01;
n=numel(ey);
exact=ey(1)+k*((d-s).*x);
f=@(x,y) k*(d-s);
for i=1:n-1
    k1=h*f(x(i),ry(i));
    k2=h*f(x(i)+0.5*h,ry(i)+0.5*k1);
    k3=h*f(x(i)+0.5*h,ry(i)+0.5*k2);
    k4=h*f(x(i)+h,ry(i)+k3);
    ry(i+1)=ry(i)+1/6*(k1+2*k2+2*k3+k4);
    ey(i+1)=ey(i)+h*f(i);
    re(i)=100*(abs(exact(i)-ry(i))/exact(i));
    re(n)=100*(abs(exact(n)-ry(n))/exact(n));
    ee(i)=100*(abs(exact(i)-ey(i))/exact(i));
    ee(n)=100*(abs(exact(n)-ey(n))/exact(n));
end
subplot(2,2,1)
plot(x,ry)
hold on
plot(x,exact)
subplot(2,2,2)
plot(x,ey)
hold on
plot(x,exact)
subplot(2,2,3)
plot(x,re)
subplot(2,2,4)
plot(x,ee)
% 
% % Q2: for demand and supply as function of time
h=1;
k=0.01;
t=0:h:15;
ey=zeros(size(t));
ry=zeros(size(t));
ey(1)=15;
ry(1)=15;
n=numel(ey);
g0=922.9-1032;
g1=27.68+3.957;
exact=ey(1)+k*(g1*(t.^2/2)+g0*t);
f=@(t,y) k*(g0+g1*t);
for i=1:n-1
    k1=h*f(t(i),ry(i));
    k2=h*f(t(i)+0.5*h,ry(i)+0.5*k1);
    k3=h*f(t(i)+0.5*h,ry(i)+0.5*k2);
    k4=h*f(t(i)+h,ry(i)+k3);
    ry(i+1)=ry(i)+1/6*(k1+2*k2+2*k3+k4);
    ey(i+1)=ey(i)+h*f(t(i),ey(i));
    re(i)=100*(abs(exact(i)-ry(i))/exact(i));
    re(n)=100*(abs(exact(n)-ry(n))/exact(n));
    ee(i)=100*(abs(exact(i)-ey(i))/exact(i));
    ee(n)=100*(abs(exact(n)-ey(n))/exact(n));
end
subplot(2,2,1)
plot(t,ry)
hold on
plot(t,exact)
subplot(2,2,2)
plot(t,ey)
hold on
plot(t,exact)
subplot(2,2,3)
plot(t,re)
subplot(2,2,4)
plot(t,ee)
% 
% 
% % Q3: for demand and supply as function of time(polynomial)
% 
h2=6.853-2.071;
h1=-47.703+26.74;
h0=1073.673-1077.1;
exact=ey(1)+k*(h2*(t.^3/3)+h1*(t.^2/2)+h0*t);
f=@(t,y) k*(h0+h1*t+h2*t^2);
for i=1:n-1
    k1=h*f(t(i),ry(i));
    k2=h*f(t(i)+0.5*h,ry(i)+0.5*k1);
    k3=h*f(t(i)+0.5*h,ry(i)+0.5*k2);
    k4=h*f(t(i)+h,ry(i)+k3);
    ry(i+1)=ry(i)+1/6*(k1+2*k2+2*k3+k4);
    ey(i+1)=ey(i)+h*f(t(i),ey(i));
    re(i)=100*(abs(exact(i)-ry(i))/exact(i));
    re(n)=100*(abs(exact(n)-ry(n))/exact(n));
    ee(i)=100*(abs(exact(i)-ey(i))/exact(i));
    ee(n)=100*(abs(exact(n)-ey(n))/exact(n));
end
subplot(2,2,1)
plot(t,ry)
hold on
plot(t,exact)
subplot(2,2,2)
plot(t,ey)
hold on
plot(t,exact)
subplot(2,2,3)
plot(t,re)
subplot(2,2,4)
plot(t,ee)
% 
% % Q4: now for d and s are function of price (linear)
% 
g0=736.4-1040;
g1=16.76+1.485;
exact=(((g0+g1*ey(1)).*exp(k*g1*t))-g0)/g1;
f=@(t,y) k*(g0+g1*y);
for i=1:n-1

    k1=h*f(t(i),ry(i));
    k2=h*f(t(i)+0.5*h,ry(i)+0.5*k1);
    k3=h*f(t(i)+0.5*h,ry(i)+0.5*k2);
    k4=h*f(t(i)+h,ry(i)+k3);
    ry(i+1)=ry(i)+1/6*(k1+2*k2+2*k3+k4);
    ey(i+1)=ey(i)+h*f(t(i),ey(i));
    re(i)=100*(abs(exact(i)-ry(i))/exact(i));
    re(n)=100*(abs(exact(n)-ry(n))/exact(n));
    ee(i)=100*(abs(exact(i)-ey(i))/exact(i));
    ee(n)=100*(abs(exact(n)-ey(n))/exact(n));
end
subplot(2,2,1)
plot(t,ry)
hold on
plot(t,exact)
subplot(2,2,2)
plot(t,ey)
hold on
plot(t,exact)
subplot(2,2,3)
plot(t,re)
subplot(2,2,4)
plot(t,ee)
% 
% % Q5: d and s are polynomial function of price
% 
g0=55513.787+3845.1389;
g1=-10158.3336+979.6366;
g2=696.3364+72.1238;
g3=-20.8186-2.2970;
g4=0.2295+0.0267;
% Demand equation : y = 0.2295x^4 - 20.8186x^3 + 696.3364x^2 - 10158.3336x + 55513.787
% Supply equation : y = -0.0267x^4 + 2.2970x^3 - 72.1238x^2 + 979.6366x - 3845.1389
f=@(t,y) k*(g0+g1*y+g2*y^2+g3*y^3+g4*y^4);
for i=1:n-1
    k1=h*f(t(i),ry(i));
    k2=h*f(t(i)+0.5*h,ry(i)+0.5*k1);
    k3=h*f(t(i)+0.5*h,ry(i)+0.5*k2);
    k4=h*f(t(i)+h,ry(i)+k3);
    ry(i+1)=ry(i)+1/6*(k1+2*k2+2*k3+k4);
    ey(i+1)=ey(i)+h*f(t(i),ey(i));

end
subplot(1,2,1)
plot(t,ry)
subplot(1,2,2)
plot(t,ey)
% 
% % Q6: when population depends on birth and death rate and both are positive constat.
h=1;
t=0:h:10;
ey=zeros(size(t));
ry=zeros(size(t));
ey(1)=1000;
ry(1)=1000;
b=0.4;
d=0.3;
exact=ey(1)*exp((b-d).*t);
f=@(t,y) (b-d)*y;
n=numel(ey);
for i=1:n-1
    k1=h*f(t(i),ry(i));
    k2=h*f(t(i)+0.5*h,ry(i)+0.5*k1);
    k3=h*f(t(i)+0.5*h,ry(i)+0.5*k2);
    k4=h*f(t(i)+h,ry(i)+k3);
    ry(i+1)=ry(i)+1/6*(k1+2*k2+2*k3+k4);
    ey(i+1)=ey(i)+h*f(t(i),ey(i));
    re(i)=100*(abs(exact(i)-ry(i))/exact(i));
    re(n)=100*(abs(exact(n)-ry(n))/exact(n));
    ee(i)=100*(abs(exact(i)-ey(i))/exact(i));
    ee(n)=100*(abs(exact(n)-ey(n))/exact(n));
end
subplot(2,2,1)
plot(t,ry)
hold on
plot(t,exact)
subplot(2,2,2)
plot(t,ey)
hold on
plot(t,exact)
subplot(2,2,3)
plot(t,re)
subplot(2,2,4)
plot(t,ee)


% Q7: birth and death rate are function of time : 

t=0:0.00001:1;
h=0.00001;
ey=zeros(size(t));
ry=zeros(size(t));
ey(1)=87.05;
ry(1)=87.05;
n=numel(ey);
exact=87.05*exp(-0.3623*((t.^2)/2)+21.55*t);
f=@(t,y) (21.55-0.3623*t)*y;
for i=1:n-1

    k1=h*f(t(i),ry(i));
    k2=h*f(t(i)+0.5*h,ry(i)+0.5*k1);
    k3=h*f(t(i)+0.5*h,ry(i)+0.5*k2);
    k4=h*f(t(i)+h,ry(i)+k3);
    ry(i+1)=ry(i)+1/6*(k1+2*k2+2*k3+k4);
    ey(i+1)=ey(i)+h*f(t(i),ey(i));
    re(i)=100*(abs(exact(i)-ry(i))/exact(i));
    re(n)=100*(abs(exact(n)-ry(n))/exact(n));
    ee(i)=100*(abs(exact(i)-ey(i))/exact(i));
    ee(n)=100*(abs(exact(n)-ey(n))/exact(n));
end
subplot(2,2,1)
plot(t,ry)
hold on
plot(t,exact)
subplot(2,2,2)
plot(t,ey)
hold on
plot(t,exact)
subplot(2,2,3)
plot(t,re)
subplot(2,2,4)
plot(t,ee)
% Q8 when population is polynomil function of time
a=[32.866382,-0.987768,0.0864,-0.005963,0.000171,0.000002];
b=[11.4223906,-0.3986533,0.0257024,-0.001359,0.0000374,-0.0000004];
g=a-b;
exact=87.05*exp(g(1)*t + g(2)*(t.^2)/2+g(3)*(t.^3)/3+g(4)*(t.^4)/4+g(5)*(t.^5)/5+g(6)*(t.^6)/6);
f=@(t,y) (g(1)+g(2)*t+g(3)*t^2+g(4)*t^3+g(5)*t^4+g(6)*t^5)*y;
for i=1:n-1

    k1=h*f(t(i),ry(i));
    k2=h*f(t(i)+0.5*h,ry(i)+0.5*k1);
    k3=h*f(t(i)+0.5*h,ry(i)+0.5*k2);
    k4=h*f(t(i)+h,ry(i)+k3);
    ry(i+1)=ry(i)+1/6*(k1+2*k2+2*k3+k4);
    ey(i+1)=ey(i)+h*f(t(i),ey(i));
    re(i)=100*(abs(exact(i)-ry(i))/exact(i));
    re(n)=100*(abs(exact(n)-ry(n))/exact(n));
    ee(i)=100*(abs(exact(i)-ey(i))/exact(i));
    ee(n)=100*(abs(exact(n)-ey(n))/exact(n));
end
subplot(2,2,1)
plot(t,ry)
hold on
plot(t,exact)
subplot(2,2,2)
plot(t,ey)
hold on
plot(t,exact)
subplot(2,2,3)
plot(t,re)
subplot(2,2,4)
plot(t,ee)

% Q9: when birth and death rate are function of population
alpha0=55.30;
alpha1=-2.713;
beta0=15.57;
beta1=-0.0615;
alpha=alpha0-beta0;
beta=beta1-alpha1;
exact=87.05./((1-(beta*ey(1)/alpha)).*exp(-alpha*t)+(beta/alpha)*ey(1));
f=@(t,y) (alpha-beta*y)*y;
for i=1:n-1
    k1=h*f(t(i),ry(i));
    k2=h*f(t(i)+0.5*h,ry(i)+0.5*k1);
    k3=h*f(t(i)+0.5*h,ry(i)+0.5*k2);
    k4=h*f(t(i)+h,ry(i)+k3);
    ry(i+1)=ry(i)+1/6*(k1+2*k2+2*k3+k4);
    ey(i+1)=ey(i)+h*f(t(i),ey(i));
    re(i)=100*(abs(exact(i)-ry(i))/exact(i));
    re(n)=100*(abs(exact(n)-ry(n))/exact(n));
    ee(i)=100*(abs(exact(i)-ey(i))/exact(i));
    ee(n)=100*(abs(exact(n)-ey(n))/exact(n));
end
subplot(2,2,1)
plot(t,ry)
hold on
plot(t,exact)
subplot(2,2,2)
plot(t,ey)
hold on
plot(t,exact)
subplot(2,2,3)
plot(t,re)
subplot(2,2,4)
plot(t,ee)
