% for a=1:-0.1:0
%     fprintf('the value is %d\n',a)
% end
% 
% for a2=[10,20,30]
%     disp(a2)
% end

% A='SVNIT';
% for i=1:length(A)
%     fprintf('%c\n',A(i))
% end

% while loop
% 
% a=10;
% while(a<20)
%     disp(a)
%     a=a+1;
% end

% nested loop

% for row=1:4
%     for col=1:3
%         fprintf('(%d,%d)',row,col)
%     end
% end

% a=9;
% while (a<20)
% 
%     a=a+1;
%     if a==15
%         continue
%     end
%     disp(a)
% end

% Now (x,y) ploting of graph
% x=[0:pi/100:2*pi];
% y=sin(x);
% y1=cos(x)
% % plot(x,y,x,y1)
% plot(x,y)
% hold on
% plot(x,y1)
% xlabel('X')
% ylabel('Sin(x)')
% legend('sin(x)')

% x=[0:pi/100:pi];
% y=tan(sin(x)-sin(tan(x)));
% plot(x,y)

% x=[0:pi/100:2*pi];
% y=sin(x);
% y1=cos(x);
% y2=tan(x);
% y3=sec(x);
% subplot(2,2,1)
% plot(x,y)
% legend('Sin(x)')
% ylabel('SIN(X)')
% subplot(2,2,2)
% plot(x,y1,'r')
% legend('Cos(x)')
% subplot(2,2,3)
% plot(x,y2,'g')
% legend('tan(x)')
% subplot(2,2,4)
% plot(x,y3,'y')
% legend('sec(x)')

% case 1
f=5

p0=1000;
b=[0.4,0.3,0.5];
d=[0.3,0.5,0.5];
x=[];
T=0:10;
for i=b-d
    for t=0:10
        y=p0*exp(i*t);
        fprintf('The population for case %d at time %d is %d \n',i,t,y);
        x{t+1}=y;
    end
    y=cell2mat(x);
    disp(x)
    disp(y)
    plot(T,y);
    hold on
    legend('a','b','c')

end
