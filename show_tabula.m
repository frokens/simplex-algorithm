function [] = show_tabula(A, b, x_b_index, c_b, theta,sigma)
    format rat;
    
    disp("      c_b            x_b             b");
    disp([c_b(:), x_b_index(:), b]);
    disp("--------------------------------------------------------------------");
    
    disp("       A & theta");
    disp([A, theta]);
    disp("       sigma");
    disp(sigma);
    disp("--------------------------------------------------------------------");
    disp("---------------------------------------------------------------------");