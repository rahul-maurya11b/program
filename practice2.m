C=0.03;
syms y1(t) y2(t) y3(t)
ode1=diff(y1)==((100/3000)*C-(100/3000)*y1);
ode2=diff(y2)==((100/3000)*y1-(100/3000)*y2);
ode3=diff(y3)==((100/3000)*y2-(100/3000)*y3);

odes=[ode1;ode2;ode3];
cond1=y1(1)==0.01;
cond2=y2(1)==0.05;
cond3=y3(1)==0.04;
conds=[cond1;cond2;cond3];
[exact_1,exact_2,exact_3]=dsolve(odes,conds);
exact_1
exact_2=simplify(exact_2)
exact_3=simplify(exact_3)