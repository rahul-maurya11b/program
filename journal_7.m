% Question: from practical 6 find numerical solution and compare the errors
% Q1: for demand and supply as constant

h=1;
x=0:3;
y=zeros(size(x));
y(1)=15;
n=numel(y);
d=[1065.4,991.8,971.3,999.2];
s=[1047,1046.5,1011.8,1000.5];
k=0.01;
exact=y(1)+k*((d-s).*x);
for i=1:3
    f(i)=k*(d(i)-s(i));
    y(i+1)=y(i)+h*f(i);
    e(i)=100*(abs(exact(i)-y(i))/exact(i));
    e(n)=100*(abs(exact(n)-y(n))/exact(n));
end
subplot(1,2,1)
plot(x,y)
hold on
plot(x,exact)
subplot(1,2,2)
plot(x,e)

% Q2: for demand and supply as function of time

t=0:15;
y=zeros(size(t));
y(1)=15;
n=numel(y);
g0=922.9-1032;
g1=27.68+3.957;
exact=y(1)+k*(g1*(t.^2/2)+g0*t);
for i=1:n-1
    f(i)=k*(g0+g1*t(i));
    y(i+1)=y(i)+h*f(i);
    e(i)=100*(abs(exact(i)-y(i))/exact(i));
    e(n)=100*(abs(exact(n)-y(n))/exact(n));
end
figure
subplot(1,2,1)
plot(t,y)
hold on
plot(t,exact)
subplot(1,2,2)
plot(t,e)

% Q3: for demand and supply as function of time(polynomial)

h2=6.853-2.071;
h1=-47.703+26.74;
h0=1073.673-1077.1;
exact=y(1)+k*(h2*(t.^3/3)+h1*(t.^2/2)+h0*t);
for i=1:n-1
    f(i)=k*(h0+h1*t(i)+h2*t(i)^2);
    y(i+1)=y(i)+h*f(i);
    e(i)=100*(abs(exact(i)-y(i))/exact(i));
    e(n)=100*(abs(exact(n)-y(n))/exact(n));
end
subplot(1,2,1)
plot(t,y)
hold on
plot(t,exact)
subplot(1,2,2)
plot(t,e)

% Q4: now for d and s are function of price (linear)

g0=736.4-1040;
g1=16.76+1.485;
exact=(((g0+g1*y(1)).*exp(k*g1*t))-g0)/g1;
n=numel(y);
for i=1:n-1
    f(i)=k*(g0+g1*y(i));
    y(i+1)=y(i)+h*f(i);
    e(i)=100*(abs(exact(i)-y(i))/exact(i));
    e(n)=100*(abs(exact(n)-y(n))/exact(n));
end
subplot(1,2,1)
plot(t,y)
hold on
plot(t,exact)
subplot(1,2,2)
plot(t,e)

% Q5: d and s are polynomial function of price

g0=55513.787+3845.1389;
g1=-10158.3336+979.6366;
g2=696.3364+72.1238;
g3=-20.8186-2.2970;
g4=0.2295+0.0267;
% Demand equation : y = 0.2295x^4 - 20.8186x^3 + 696.3364x^2 - 10158.3336x + 55513.787
% Supply equation : y = -0.0267x^4 + 2.2970x^3 - 72.1238x^2 + 979.6366x - 3845.1389
for i=1:n-1
    f(i)=k*(g0+g1*y(i)+g2*y(i)^2+g3*y(i)^3+g4*y(i)^4);
    y(i+1)=y(i)+h*f(i);
end
plot(t,y)

% Q6: when population depends on birth and death rate and both are positive constat.
h=1;
t=0:2;
y=zeros(size(t));
y(1)=1000;
n=numel(y);
b=[0.4,0.3,0.5];
d=[0.3,0.5,0.5];
exact=y(1)*exp((b-d).*t);
for i=1:2
    f(i)=(b(i)-d(i)).*y(i);
    y(i+1)=y(i)+h*f(i);
    e(i)=100*(abs(exact(i)-y(i))/exact(i));
    e(n)=100*(abs(exact(n)-y(n))/exact(n));
end
subplot(1,2,1)
plot(t,y)
hold on
plot(t,exact)
subplot(1,2,2)
plot(t,e)

% Q7: birth and death rate are function of time : 

t=0:0.00001:1;
h=0.00001;
y=zeros(size(t));
y(1)=87.05;
n=numel(y);
exact=87.05*exp(-0.3623*((t.^2)/2)+21.55*t);
for i=1:n-1
    f(i)=(21.55-0.3623*t(i))*y(i);
    y(i+1)=y(i)+h*f(i);
    e(i)=100*(abs(exact(i)-y(i))/exact(i));
    e(n)=100*(abs(exact(n)-y(n))/exact(n));
end

subplot(1,2,1)
plot(t,y)
y(1:100)
exact(1:100)
hold on
plot(t,exact)
subplot(1,2,2)
plot(t,e)
% a=[32.866382,-0.987768,0.0864,-0.005963,0.000171,0.000002];
% b=[11.4223906,-0.3986533,0.0257024,-0.001359,0.0000374,-0.0000004];
% g=a-b;
% exact=87.05*exp(g(1)*t + g(2)*(t.^2)/2+g(3)*(t.^3)/3+g(4)*(t.^4)/4+g(5)*(t.^5)/5+g(6)*(t.^6)/6);
% 
% for i=1:n-1
%     f(i)=(g(1)+g(2)*t(i)+g(3)*t(i)^2+g(4)*t(i)^3+g(5)*t(i)^4+g(6)*t(i)^5)*y(i);
%     y(i+1)=y(i)+h*f(i);
%     e(i)=100*(abs(exact(i)-y(i))/exact(i));
%     e(n)=100*(abs(exact(n)-y(n))/exact(n));
% end
% subplot(1,2,1)
% plot(t,y)
% y(1:100)
% exact(1:100)
% hold on
% plot(t,exact)
% legend('a','b')
% subplot(1,2,2)
% plot(t,e)

% Q8: when birth and death rate are function of population
alpha0=55.30;
alpha1=-2.713;
beta0=15.57;
beta1=-0.0615;
alpha=alpha0-beta0;
beta=beta1-alpha1;
exact=87.05./((1-(beta*y(1)/alpha)).*exp(-alpha*t)+(beta/alpha)*y(1));
for i=1:n-1
    f(i)=(alpha-beta*y(i))*y(i);
    y(i+1)=y(i)+h*f(i);
    e(i)=100*(abs(exact(i)-y(i))/exact(i));
    e(n)=100*(abs(exact(n)-y(n))/exact(n));
end
subplot(1,2,1)
plot(t,y)
y(1:100)  
exact(1:100)
hold on
plot(t,exact)
subplot(1,2,2)
plot(t,e)
