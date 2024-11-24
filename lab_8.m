% h=0.1;
% x=0:h:1;
% y=zeros(size(x));
% n=numel(y);
% f=@(x,y) 3.*exp(-x)-0.4*y;
% for i= 1:n-1
%     k1=h*f(x(i),y(i));
%     k2=h*f(x(i)+0.5*h,y(i)+0.5*k1);
%     k3=h*f(x(i)+0.5*h,y(i)+0.5*k2);
%     k4=h*f(x(i)+h,y(i)+k3);
%     y(i+1)=y(i)+1/6*(k1+2*k2+2*k3+k4);
% end
% plot(x,y)

% Q:
% f=@(x,y) x.^2+y.^2;
% y(1)=1.2;
% h=0.05;
% x=1:h:1.1;
% n=numel(y);
% 
% for i= 1:n-1
%     k1=h*f(x(i),y(i));
%     k2=h*f(x(i)+0.5*h,y(i)+0.5*k1);
%     k3=h*f(x(i)+0.5*h,y(i)+0.5*k2);
%     k4=h*f(x(i)+h,y(i)+k3);
%     y(i+1)=y(i)+1/6*(k1+2*k2+2*k3+k4);
% end
% plot(x,y)
% plot(x,sin(x))

% f=@(x,y) 7*exp(4*x)-3*y;
% 
% y(1)=2;
% h=0.1;
% x=0:h:1;
% y=zeros(size(x));
% n=numel(y);
% exact=exp(4*x)+exp(-3*x);
% for i= 1:n-1
%     k1=h*f(x(i),y(i));
%     k2=h*f(x(i)+0.5*h,y(i)+0.5*k1);
%     k3=h*f(x(i)+0.5*h,y(i)+0.5*k2);
%     k4=h*f(x(i)+h,y(i)+k3);
%     y(i+1)=y(i)+1/6*(k1+2*k2+2*k3+k4);
%     e(i)=100*(abs(exact(i)-y(i))/exact(i));
%     e(n)=100*(abs(exact(n)-y(n))/exact(n));
% end
% subplot(1,2,1)
% plot(x,y)
% hold on
% plot(x,exact)
% subplot(1,2,2)
% plot(x,e)

% f=@(x,y) 1+y+x.^2;
% h=0.1;
% x=0:h:1;
% y=zeros(size(x));
% y(1)=0.5;
% 
% n=numel(y);
% exact=3.5*exp(x)-x.^2-2*x-3;
% for i= 1:n-1
%     k1=h*f(x(i),y(i));
%     k2=h*f(x(i)+0.5*h,y(i)+0.5*k1);
%     k3=h*f(x(i)+0.5*h,y(i)+0.5*k2);
%     k4=h*f(x(i)+h,y(i)+k3);
%     y(i+1)=y(i)+1/6*(k1+2*k2+2*k3+k4);
%     e(i)=100*(abs(exact(i)-y(i))/exact(i));
%     e(n)=100*(abs(exact(n)-y(n))/exact(n));
% end
% x
% y
% exact
% e
% plot(x,e)

% merging of euler and rk method:

h=0.1;
x=0:h:1;
ey=zeros(size(x));
ry=zeros(size(x));
ey(1)=2;
ry(1)=2;
n=numel(ey);
exact=exp(4*x)+exp(-3*x);
f=@(x,y) 7*exp(4*x)-3*y;
for i= 1:n-1
    k1=h*f(x(i),ry(i));
    k2=h*f(x(i)+0.5*h,ry(i)+0.5*k1);
    k3=h*f(x(i)+0.5*h,ry(i)+0.5*k2);
    k4=h*f(x(i)+h,ry(i)+k3);
    ry(i+1)=ry(i)+1/6*(k1+2*k2+2*k3+k4);
    ey(i+1)=ey(i)+h*f(x(i),ey(i));
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
