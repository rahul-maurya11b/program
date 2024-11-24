% Pandamic Models

% SI Models

% di/dt = B*i*s;
% i+s = n;
% n= 1000
% I(0) = 15
% B = 0.01

N = 1000;
h = 0.1;
B = 0.01;
t = 0 : h : 1;

ey = zeros(size(t));
ey(1) = 15;
ry = zeros(size(t));
ry(1) = 15;

F1 = @(x,y) (B*x*(N-x));

AS = (N./(1+((N./15)-1).*exp(-1.*N.*B.*t)));

for i = 1:length(t)-1

    k11 = h * F1(ry(i),1);
    k12 = h * F1(ry(i) + k11/2,1);
    k13 = h * F1(ry(i) + k12/2,1);
    k14 = h * F1(ry(i) + k13,1);
    ry(i+1) = ry(i) + (k11 + 2*k12 + 2*k13 + k14)/6;
    
    ey(i+1) = ey(i) + h*F1(ey(i),1);
end    

figure
plot(t, AS,'b')
hold on
plot(t, ey,'r')
hold on
plot(t,ry,'g')
legend('AS','EU','RK')
title("Solutions")


% di/dt = B*i*s - 0.01 * i;
% i+s = n;
% n= 1000
% I(0) = 15
% B = 0.01

N = 1000;
h = 0.1;
B = 0.01;
Bi = 0.01;
t = 0 : h : 1;

a = N -  Bi/B;

y1_eu = zeros(size(t));
y1_eu(1) = 15;
y1_rk = zeros(size(t));
y1_rk(1) = 15;

F1 = @(x,y) (B*x*(N-x) - Bi*x);

AS = (a./(1+((a./15)-1).*exp(-1.*a.*B.*t)));

for i = 1:length(t)-1

    k11 = h * F1(y1_rk(i),1);
    k12 = h * F1(y1_rk(i) + k11/2,1);
    k13 = h * F1(y1_rk(i) + k12/2,1);
    k14 = h * F1(y1_rk(i) + k13,1);
    y1_rk(i+1) = y1_rk(i) + (k11 + 2*k12 + 2*k13 + k14)/6;
    
    y1_eu(i+1) = y1_eu(i) + h*F1(y1_eu(i),1);
end    

% figure(2)
% plot(t, AS,'b')
% hold on
% plot(t, y1_eu,'r')
% hold on
% plot(t,y1_rk,'g')
% legend('AS','EU','RK')
% title("Solutions")