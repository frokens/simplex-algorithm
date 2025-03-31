function [A,b,x_b_index,x] = simplexMethod(A,b,c)
% This function solves a linear programming problem using the two-phase simplex method.
% Inputs:
%   A - Coefficient matrix of the constraints
%   b - Right-hand side vector of the constraints
%   c - Coefficient vector of the objective function
%   AV_num - Number of artificial variables
% Outputs:
%   x - Solution vector of the linear programming problem


    format rat;
    x_b_index = zeros(size(A,1), 0);


    for i = 1:size(A,2)
        num = 0;
        x_index = 0;
        for j = 1:size(A,1)
            if A(j,i) == 0
                num = num + 1;
            end
            if A(j,i) == 1
                x_index = j;
            end
        end
        if (num == size(A,1) -1) && (x_index ~= 0)
            x_b_index(x_index) = i;
        end
    end
    c_b = c(x_b_index);
    sigma = c - c_b * A;


    while any(sigma > 0)
        [~, entering_index] = max(sigma);
        if all(A(:,entering_index) <= 0)
            error('Problem is unbounded');
        end
        theta = inf(size(A,1),1);
        for i = 1:size(A,1)
            if A(i,entering_index) > 0
                theta(i) = b(i) / A(i,entering_index);
            end
        end
        [~, leaving_index] = min(theta);
        
        show_tabula(A, b, x_b_index, c_b, theta, sigma)
        % Update the basis
        disp(['Entering variable: ', entering_index," Leaving variable: ", num2str(x_b_index(leaving_index))]);


        x_b_index(leaving_index) = entering_index;

        

        % Update the tableau
        b(leaving_index) = b(leaving_index) / A(leaving_index,entering_index);
        A(leaving_index,:) = A(leaving_index,:) / A(leaving_index,entering_index);
    
        
        for i = 1:size(A,1)
            if i ~= leaving_index
                b(i) = b(i) - A(i,entering_index) * b(leaving_index);
                A(i,:) = A(i,:) - A(i,entering_index) * A(leaving_index,:);
            end
        end
        
        c_b = c(x_b_index);
        sigma = c - c_b * A;
    end

    theta = zeros(size(A,1),1);

    show_tabula(A, b, x_b_index, c_b, theta,sigma)

    x = zeros(size(A,2),1);
    for i = 1:size(A,1)
        if x_b_index(i) ~= 0
            x(x_b_index(i)) = b(i);
        end
    end

end