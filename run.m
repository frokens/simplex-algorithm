clc;clear;
format rat;

A = [1,2/3,1/3,0;
     0,1/3,2/3,1];

b = [100/3; 200/6];

%c = [-2,-3,-1,0,0,-1,-1];
c = [-0.5, -0.4, -0.3, -0.2];%% Objective function coefficients

[~,~,~,x] = simplexMethod(A,b,c);
disp('Optimal solution:');

x_str = 'x = [';
for i = 1:size(x)
    x_str = [x_str, num2str(x(i))]; %#ok<AGROW>
    if i ~= size(x,1)
        x_str = [x_str, ', ']; %#ok<AGROW>
    end
end
x_str = [x_str, ']'];
disp(x);
