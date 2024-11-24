% symbolic function
syms u(t) v(t)
ode1= diff(u)==3*u+4*v;
ode2=diff(v)==-4*u+3*v;
% system of ode in column form
odes=[ode1;ode2];
% now initial condition
cond1=u(0)==0;
cond2=v(0)==1;
% make condition in column form
conds=[cond1;cond2];
% gives solution of system of linear ode struct
s=dsolve(odes,conds);
% to get u and v from the struct
uSol(t)=s.u;
vSol(t)=s.v;
% or to get directly order matter of syms after that first u and v 
% [uSol(t),vSol(t)]=dsolve(odes)
% now create graph
figure(1)
fplot(uSol,'g')
hold on 
fplot(vSol)
% now solving using matrix form
syms x(t) y(t)
% define the matrix now
A=[1 2;-1 1];
B=[1;t];
Y=[x;y];
% giving both of equation in one line
odes=diff(Y)==A*Y+B;
C=Y(0)==[2;-1];
[xSol(t),ySol(t)]=dsolve(odes,C);
% after solving these we get complicated solution so to simplify
xSol=simplify(xSol(t));
ySol=simplify(ySol(t));

