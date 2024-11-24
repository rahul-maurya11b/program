% h=0.5;
% t=0:h:2;
% 
% y1=zeros(size(t));
% y2=zeros(size(t));
% y1(1)=4;
% y2(1)=6;
% f1=@(t,y1,y2) (-0.5*y1);
% f2=@(t,y1,y2) (4-0.3*y2-0.1*y1);
% n=numel(t);
% for i=1:n-1
%     k1=h*f1(t(i),y1(i),y2(i));
%     k2 = h * f1(t(i) + 0.5 * h, y1(i) + 0.5 * k1,y2(i)+0.5*k1);
%     k3 = h * f1(t(i) + 0.5 * h, y1(i) + 0.5 * k2, y2(i)+0.5*k2);
%     k4 = h * f1(t(i) + h, y1(i) + k3,y2(i)+k3);
%     y1(i + 1) = y1(i) + (1/6) * (k1 + 2 * k2 + 2 * k3 + k4);
%     m1= h*f2(t(i),y1(i),y2(i));
%     m2 = h * f2(t(i) + 0.5 * h, y1(i) + 0.5 * m1,y2(i)+0.5*m1);
%     m3 = h * f2(t(i) + 0.5 * h, y1(i) + 0.5 * m2, y2(i)+0.5*m2);
%     m4 = h * f2(t(i) + h, y1(i) + m3,y2(i)+m3);
%     y2(i + 1) = y2(i) + (1/6) * (m1 + 2 * m2 + 2 * m3 + m4);
% 
%     % y1(i+1)=y1(i)+h*f1(t(i),y1(i),y2(i));
%     % y2(i+1)=y2(i)+h*f2(t(i),y1(i),y2(i));
% end
% figure
% plot(t,y1)
% hold on
% plot(t,y2)

% Q1:
% 
h=0.5;
t=0:h:4;

y1=zeros(size(t));
y2=zeros(size(t));
y1(1)=1;
y2(1)=1;
f1=@(t,y1,y2) (3*y1+4*y2);
f2=@(t,y1,y2) (-4*y1+3*y2);
n=numel(t);
for i=1:n-1
    k1=h*f1(t(i),y1(i),y2(i));
    k2 = h * f1(t(i) + 0.5 * h, y1(i) + 0.5 * k1,y2(i)+0.5*k1);
    k3 = h * f1(t(i) + 0.5 * h, y1(i) + 0.5 * k2, y2(i)+0.5*k2);
    k4 = h * f1(t(i) + h, y1(i) + k3,y2(i)+k3);
    y1(i + 1) = y1(i) + (1/6) * (k1 + 2 * k2 + 2 * k3 + k4);
    m1= h*f2(t(i),y1(i),y2(i));
    m2 = h * f2(t(i) + 0.5 * h, y1(i) + 0.5 * m1,y2(i)+0.5*m1);
    m3 = h * f2(t(i) + 0.5 * h, y1(i) + 0.5 * m2, y2(i)+0.5*m2);
    m4 = h * f2(t(i) + h, y1(i) + m3,y2(i)+m3);
    y2(i + 1) = y2(i) + (1/6) * (m1 + 2 * m2 + 2 * m3 + m4);

    % y1(i+1)=y1(i)+h*f1(t(i),y1(i),y2(i));
    % y2(i+1)=y2(i)+h*f2(t(i),y1(i),y2(i));
end
figure
plot(t,y1)
hold on
plot(t,y2)

% Q2:
h=0.1;
t=0:h:1;

y1=zeros(size(t));
y2=zeros(size(t));
y1(1)=2;
y2(1)=-1;
f1=@(t,y1,y2) (y1+2*y2+1);
f2=@(t,y1,y2) (-y1+y2+t);
n=numel(t);
for i=1:n-1
    k1=h*f1(t(i),y1(i),y2(i));
    k2 = h * f1(t(i) + 0.5 * h, y1(i) + 0.5 * k1,y2(i)+0.5*k1);
    k3 = h * f1(t(i) + 0.5 * h, y1(i) + 0.5 * k2, y2(i)+0.5*k2);
    k4 = h * f1(t(i) + h, y1(i) + k3,y2(i)+k3);
    y1(i + 1) = y1(i) + (1/6) * (k1 + 2 * k2 + 2 * k3 + k4);
    m1= h*f2(t(i),y1(i),y2(i));
    m2 = h * f2(t(i) + 0.5 * h, y1(i) + 0.5 * m1,y2(i)+0.5*m1);
    m3 = h * f2(t(i) + 0.5 * h, y1(i) + 0.5 * m2, y2(i)+0.5*m2);
    m4 = h * f2(t(i) + h, y1(i) + m3,y2(i)+m3);
    y2(i + 1) = y2(i) + (1/6) * (m1 + 2 * m2 + 2 * m3 + m4);
    
    % y1(i+1)=y1(i)+h*f1(t(i),y1(i),y2(i));
    % y2(i+1)=y2(i)+h*f2(t(i),y1(i),y2(i));
end
figure
plot(t,y1)
hold on
plot(t,y2)
legend('y1','y2')

%Q3

h = 0.1; t = 100:h:1000;
r=100;
v=3000;
C=0.03;
y1=zeros(size(t));
y2=zeros(size(t));
y3=zeros(size(t));
y1(1)=0.01;
y2(1)=0.05;
y3(1)=0.04;
f1=@(t,y1,y2,y3) ((100/3000)*C-(100/3000)*y1);
f2=@(t,y1,y2,y3) ((100/3000)*y1-(100/3000)*y2);
f3=@(t,y1,y2,y3) ((100/3000)*y2-(100/3000)*y3);
exact_1=C + (0.01-C).*exp((-r*t)/v);
exact_2=C+((0.05-C)+(r/v)*(0.01-C).*t).*exp((-r*t)/v);
exact_3 = C + (r/v*(0.05-C)*t+(r^2/(2*(v^2)))*(0.01-C)*(t.^2)+(0.04-C)).*exp((-r*t)/v);
n=numel(t);
for i=1:n-1
    % k1=h*f1(t(i),y1(i),y2(i));
    % k2 = h * f1(t(i) + 0.5 * h, y1(i) + 0.5 * k1,y2(i)+0.5*k1);
    % k3 = h * f1(t(i) + 0.5 * h, y1(i) + 0.5 * k2, y2(i)+0.5*k2);
    % k4 = h * f1(t(i) + h, y1(i) + k3,y2(i)+k3);
    % y1(i + 1) = y1(i) + (1/6) * (k1 + 2 * k2 + 2 * k3 + k4);
    % m1= h*f2(t(i),y1(i),y2(i));
    % m2 = h * f2(t(i) + 0.5 * h, y1(i) + 0.5 * m1,y2(i)+0.5*m1);
    % m3 = h * f2(t(i) + 0.5 * h, y1(i) + 0.5 * m2, y2(i)+0.5*m2);
    % m4 = h * f2(t(i) + h, y1(i) + m3,y2(i)+m3);
    % y2(i + 1) = y2(i) + (1/6) * (m1 + 2 * m2 + 2 * m3 + m4);

    y1(i+1)=y1(i)+h*f1(t(i),y1(i),y2(i),y3(i));
    y2(i+1)=y2(i)+h*f2(t(i),y1(i),y2(i),y3(i));
    y3(i+1)=y3(i)+h*f3(t(i),y1(i),y2(i),y3(i));

end
ee1= 100 * abs((exact_1 - y1) ./ exact_1);
ee2= 100 * abs((exact_2 - y2) ./ exact_2);
ee3= 100 * abs((exact_3 - y3) ./ exact_3);
figure
% subplot(2,2,1)
plot(t,y1)
hold on
plot(t,exact_1)
figure
% subplot(2,2,2)
plot(t,y2)
hold on
plot(t,exact_2)
% 
figure
% subplot(2,2,3)
plot(t,y3)
hold on
plot(t,exact_3)