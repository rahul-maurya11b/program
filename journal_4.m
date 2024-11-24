% Q1
result=10;
n=10;
factorial(10)
for i=1:9
    result=result*(n-i);
end
disp(result)

while j<10
    result=result*(n-j);
    j=j+1;
end
disp(result)

% Q2

F=[0,1];
for i=[2:10]
    F=[F,F(i)+F(i-1)];
end
F

% Q3
x=-2*pi:0.1:2*pi;
y1=sin(x); 
y2=cos(x);
y3=tan(x);
y4=exp(-x.^2);

plot(x,y1);
hold on 
plot(x,y2);
xlabel('X')
ylabel('Y(X)')
legend('Y1','Y2')

% subplot(2,2,1)
% plot(x,y1)
% xlabel('X')
% ylabel('Y1(X)')
% % legend('Y1')
% subplot(2,2,2)
% plot(x,y2)
% xlabel('X')
% ylabel('Y2(X)')
% % legend('Y2')
% subplot(2,2,3)
% plot(x,y3)
% xlabel('X')
% ylabel('Y3(X)')
% % legend('Y3')
% subplot(2,2,4)
% plot(x,y4)
% xlabel('X')
% ylabel('Y4(X)')
% % legend('Y4')
