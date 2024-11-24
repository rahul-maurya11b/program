h=0.1;
x=1:h:2;
y=zeros(size(x));
y(1)=1;
n=numel(y);
% for i = 1:n-1
%     f(i)=-2*x(i)^3+12*x(i)^2-20*x(i)+8.5;
%     y(i+1)=y(i)+h*f(i);
% end
% plot(x,y);

% Question: from practical 6 find numerical solution and compare the errors
% expand d and s to get smooth curve
% d=[1065.4,991.8,971.3,999.2];
% s=[1047,1046.5,1011.8,1000.5];
% k=0.0001;
% for i=1:4
%     f(i)=k*(d(i)-s(i));
%     y(i+1)=y(i)+h*f(i);
% end
% plot(x,y)
exact=exp(4*x)+exp(-3*x);
exact
x
for i=1:n-1
    f(i)=7*exp(4*x(i))-3*y(i);
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
% exact=3*log(x)./(x.^2)+x./3+2./(3.*x.^2)
% plot(x,exact)
% for i =1:n-1
%     f(i)=3/(x(i)^3)-(2/x(i))*y(i)+1;
%     y(i+1)=y(i)+h*f(i);
%     e(i)=100*(abs(exact(i)-y(i))/exact(i));
%     e(n)=100*(abs(exact(n)-y(n))/exact(n));
% 
% end
% subplot(1,2,1)
% plot(x,y)
% hold on
% plot(x,exact)
% subplot(1,2,2)
% plot(x,e)