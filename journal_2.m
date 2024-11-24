% Q1
a=[sinh(0),sinh(5),sinh(-5),sinh(6),sinh(6.32)];
b=[cosh(0),cosh(5),cosh(-5),cosh(6.32)];
c=[tanh(0),tanh(5),tanh(-5),tanh(6.32)];
d=[sin(-10.62),cos(-10.23),tan(-15)];
e=[sign(0),sign(5),sign(-5)];

%Q2
f=-5 + 7i;
g=7-5i;
h=0+112i;
i=[abs(f),abs(g),abs(h),angle(f),angle(g),angle(h),conj(f),conj(g),conj(h),imag(f),imag(g),imag(h),real(f),real(g),real(h)];

% Q3
j=[factor(1234),factor(5432),factor(71),factor(125)];
k=[factorial(8),factorial(25),factorial(13),factorial(19)];
l=[gcd(300,9),gcd(1250,135),gcd(4321,1234),gcd(1111,11)];
m=[lcm(300,9),lcm(1250,135),lcm(4321,1234),lcm(1111,11)];
n=[mod(300,9),mod(1250,135),mod(4321,1234),mod(1111,11)];

% Q4
o=1:10;
p=size(o);
q=transpose(o);

% Q5
r=randi([1,10],3,3);
s=inv(r);
t=det(r);
u=transpose(r);
v=r.^2;

% Q6
w=randi([1,10],3,3);
x=r.*w;
r
w
x
y=x(2,3);
y

% Q7
z=[r,w];
z_a=[r;w];

% Q8
z_b=diag(r);
z_c=[r;[5,10,15]]
z_d=[w,[4;7;9]]



