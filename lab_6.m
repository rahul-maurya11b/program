% Price predictin model

% Q1 when b and d are constant
disp('Q1')
k=0.01;
p0=15;
d=[1065.4,991.8,971.3,999.2];
s=[1047,1046.5,1011.8,1000.5];
g=d-s;
t=0:3;
p=p0+t*k.*g;
plot(t,p);  
%%
% Q2 When b and d are linear functin of time 
% 
% d=27.68t+922.9;
% s=-3.957t+1032;
disp('Q2')
g0=922.9-1032;
g1=27.68+3.957;
t=0:15;
p=p0+k*(g1.*(t.^2/2)+g0.*t);
plot(t,p)
% 
% Q3 when b and d are polynomial function of time 
% y=2.071x^2−26.74x+1077.1 supply equation
% y=6.853x^2−47.703x+1073.673 demand equation
disp('Q3')
h2=6.853-2.071;
h1=-47.703+26.74;
h0=1073.673-1077.1;
p=p0+k*(h2.*(t.^3/3)+h1.*(t.^2/2)+h0*t);
plot(t,p);
% Q4 when  demand and supply are function of price
% supply equation : Equation	Y = -1.485*X + 1040
% demand equatin : Equation	Y = 16.76*X + 736.4
disp('Q4')
g0=736.4-1040;
g1=16.76+1.485;
t=0:15;
p=((g0+g1*p0).*exp(k*g1.*t))./g1-(g0/g1);
plot(t,p);


% Q5 Now when demand and supply are polynomial function of price.
% Demand equation : y = 0.2295x^4 - 20.8186x^3 + 696.3364x^2 - 10158.3336x + 55513.787
% Supply equation : y = -0.0267x^4 + 2.2970x^3 - 72.1238x^2 + 979.6366x - 3845.1389

% See for element wise