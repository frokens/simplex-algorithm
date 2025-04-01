clc;clear;
format rat;

A = [5,3,1,1,0,0,0;
     -5,6,15,0,1,0,0;
     2,1,1,0,0,-1,1;];

b = [9; 15; 5];

%c = [-2,-3,-1,0,0,-1,-1];
c = [0,0,0,0,0,0,-1];%% Objective function coefficients

x = twoPhraseSimplexMethod(A,b,c,1);
disp('Optimal solution:');

x_str = 'x = [';
for i = 1:size(x)
    x_str = [x_str, num2str(x(i))]; %#ok<AGROW>
    if i ~= size(x,1)
        x_str = [x_str, ', ']; %#ok<AGROW>
    end
end
x_str = [x_str, ']'];
disp(x_str);