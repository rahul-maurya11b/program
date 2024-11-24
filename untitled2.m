z=complex(-1,2);
a=abs(z);
r=real(z);
i=imag(z);
c=conj(z);
ir=isreal(r);
% vector
A=[1 2 3 4];
a=size(A);
B=[1;2;3;4];
b=size(B);
X=[1:1:10];
x=linspace(1,10,3);
a=zeros(5,1);
a=ones(5,1);

a=[1,2,3];
b=[4,5,6];
a(2);
b(3);
c=sin(a);
a(3)=[];
c=[a b];
c=horzcat(a,b);
% element wise division
d=1./a;
d=a/3;

% matrix
A=[1 2 3;3 4 5; 6 7 8];
size(A);
numel(A);
A(3);
A(3,2);
A(:,3)=[];
A(3,:)=[5,6];
A(:,3)=[5;6;7];
diag(A);
B=[2 3 4; 2 5 6; 3 4 7];
add=A+B;
mul=A.*B;
mul1=A*B;
A./B;
A./3;
t=transpose(A);
t=A';
p=A.^2;
square=A^2;
I=eye(3);
d=det(A);
i=inv(A);
C=[A B];
R=[A;B];
a=[1 2 3]
diag(a);
diag(A,1) ;% upper
diag(A,-1); % lower
triu(A);
A
f=fliplr(A)
flipud(A);
A(4,:)=[2 3 4];
A
fliplr(A);
flipud(A);

find(A>5) % display the position;
A(A>5)=0
A(2)


