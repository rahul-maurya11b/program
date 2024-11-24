% sirs model
N=5000;
b=0.1;
g=0.01;
h=0.001;
t=0:h:0.1;
bd=0.009;
I=zeros(size(t));
S=zeros(size(t));
R=zeros(size(t));
I(1)=100;
S(1)=4900;
R(1)=0;
f1=@(t,I,S,R) b*I*S-g*I;
f2=@(t,I,S,R) -b*I*S;
f3=@(t,I,S,R) g*I;
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

    I(i+1)=I(i)+h*f1(t(i),I(i),S(i),R(i));
    S(i+1)=S(i)+h*f2(t(i),I(i),S(i),R(i));
    R(i+1)=R(i)+h*f3(t(i),I(i),S(i),R(i));
end
figure
plot(t,I,'r')
hold on 
plot(t,S,'g')
hold on
plot(t,R,'b')


% Q2: slight change in model infected to susceptible with bd 

f1=@(t,I,S,R) b*I*S-g*I -bd*I;
f2=@(t,I,S,R) -b*I*S + bd*I;
f3=@(t,I,S,R) g*I;
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

    I(i+1)=I(i)+h*f1(t(i),I(i),S(i),R(i));
    S(i+1)=S(i)+h*f2(t(i),I(i),S(i),R(i));
    R(i+1)=R(i)+h*f3(t(i),I(i),S(i),R(i));
end
figure
plot(t,I,'r')
hold on 
plot(t,S,'g')
hold on
plot(t,R,'b')

% Q3: SISLR model  :

% ***********not clear*********** ds/dt
L=zeros(size(t));
I(1)=50;
L(1)=50;
gd=0.03;
gdd=0.06;
f1=@(t,I,S,R,L) -g*I + bd*L- gdd*I;
f2=@(t,I,S,R,L) -b*L*S + g*I;
f3=@(t,I,S,R,L) gd*I + gdd*L ;
f4=@(t,I,S,R,L) b*S*L-bd*L-gd*R;
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

    I(i+1)=I(i)+h*f1(t(i),I(i),S(i),R(i),L(i));
    S(i+1)=S(i)+h*f2(t(i),I(i),S(i),R(i),L(i));
    R(i+1)=R(i)+h*f3(t(i),I(i),S(i),R(i),L(i));
    L(i+1)=L(i)+h*f4(t(i),I(i),S(i),R(i),L(i));
end
figure
plot(t,I,'r')
hold on 
plot(t,S,'g')
hold on
plot(t,R,'b')
hold on
plot(t,L)