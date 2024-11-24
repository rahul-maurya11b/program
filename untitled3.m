A=[1 2 3;3 2 1; 4 5 2];
B=[3 4 5; 0 1 2; 3 1 2];
% Q1; Find A3+b2+2ab
%Q2; veryfiy i (A+B)^2=A2+2ab+b2 ii (A+B)^3=A3+B3+3A2B+3AB2
%Q3; A3+ 5A2+6AB +9B3+7B4
%Q4:  find A and b inverse then verify inv(AB)=inv(B)inv(A)

c=A*A;
p=A^2;
%Q1: 
q1=A*A*A+B*B+2.*A*B;

%Q2:

q21=(A+B)^2;
q22=A^2+2.*(A*B)+B^2;

% Q2 ii
q23=(A+B)^3;
q24=A^3+B^3+3.*(A^2*B)+3.*(A*B^2);

% Q3 
q3=A^3+5.*A^2+6.*(A*B)+9.*B^3+7.*B^4;
%Q4

q41=inv(A);
q42=inv(B);
q43=inv(A*B)
q44=inv(B)*inv(A)
q43==q44

C=[1 1 1; 2 1 3; 3 7 9];
D=[3; 4; 6];
inv(C)*D

