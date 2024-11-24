% Q1
marks=input('Enter your marks: ');
if marks >95
    disp('Your grade is A')
elseif marks >86 && marks <=95
    disp('Your grade is B')
elseif marks >76 && marks<=86
    disp('Your grade is  C')
elseif marks>66 && marks<=76
    disp('Your grade is D')
else
    disp('Your grade is F')
end

% Q2

num=input('Enter number: ');

if mod(num,2)==0
    disp('Your entered number is even')
else
    disp('Your number is odd')
end

switch mod(num,2)==0
    case 1
        disp('Your entered number is even')
    otherwise
        disp('Your number is odd')
end

% Q3

day=input('Enter day from 1 to 7: ');

switch day
    case {6,7}
        disp('weekend')
    otherwise
        disp('weekday')
end
