function x = twoPhraseSimplexMethod(A, b, c, AV_num)
    format rat;
    disp('Phase 1 result:');
    [A,b,x_b_index,~] = simplexMethod(A,b,c);
    
    if any(x_b_index >= size(A,2) - AV_num + 1)
        error('Problem is infeasible');
    end

    disp('Phase 2 result:');
    A = A(:,1:size(A,2) - AV_num + 1);
    c = c(1:size(A,2) - AV_num + 1);
    
    [~,~,~,x] = simplexMethod(A,b,c);
end