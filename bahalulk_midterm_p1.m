function [a, n] = bahalulk_midterm_p1(fdf, a0, x, y, tol)
%BAHALULK_MIDTERM_P1 creates a generalized nonlinear regression function based on the Gauss-Newton Algorithm.
% 
%   Inputs:
%       fdf - an external function which returns the residual vector and Jacobian matrix.
%       a0 - the initial guess at the coefficients, stored as a column vector.
%       x - contains the x-locations of column vectors.
%       y - contains the y-locations of column vectors.
%       tol - tolerance to solve to.
%
%   Outputs:
%       a - a column array the same length as a0 with the converged coefficients.
%       n - the number of iterations it took to converge.

    damp = 1;                   % initializing damping factor
    % an external function which returns the residual vector - r and Jacobian matrix - J
    [r, J] = fdf(a0, x, y);
    residual_norm = norm(r);    % to get norm values of residual column vector
    n = 0;                      % initializing the count of iterations
    
    % outer iterate is iterated until convergence and 100 iterations are reached
    while (norm(J'*r) > tol) && (n < 100)
        full_step = - J\r;              % calculation full step using jacobian matrix and residual vector
        damp_step = damp*full_step;     % to get dampped step value
        a = a0 + damp_step;             % update the coefficient value using dampped step value with old coefficient
        [r, J] = fdf(a, x, y);          % updated function to get residual vector and Jacobian matrix
        updated_residual_norm = norm(r);% to get norm values of updated residual column vector
        inner_itr = 0;                  % count of inner iteration for damping
        % inner interation is iterated until updated_residual_norm and 10 iterations are reached
        while (updated_residual_norm > residual_norm) && (inner_itr < 10)
            damp = damp/2;                  % cutting damping factor down by one-half
            damp_step = damp*full_step;     % to get dampped step value
            a = a0 + damp_step;             % update the coefficient value using dampped step value with old coefficient
            [r, J] = fdf(a, x, y);          % updated function to get residual vector and Jacobian matrix
            updated_residual_norm = norm(r);% to get norm values of updated residual column vector
            inner_itr = inner_itr + 1;      % count of inner iteration
        end
        % gives error message if inner iteration does not converge and stop the outer loop
        if inner_itr == 10
            error('Inner iteration did not converge');
        end
        n = n + 1;                              % count incrementation for iteration
        damp = 1;                               % initializing damping factor
        a0 = a;                                 % updating coefficient value
        residual_norm = updated_residual_norm;  % to get norm values of residual column vector
    end

    % gives error message if 100 iterations reached without convergence
    if n >= 100
        error('100 iterations reached without convergence');
    end
end % bahalulk_midterm_p1
