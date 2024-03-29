function [mu, var] = bahalulk_final_p3(eigFunc, m, tol, N)
%BAHALULK_FINAL_P3 Computes the mean and variance of the number of iterations necessary to compute the spectrum using a given function.
%
%   Inputs:
%       eigFunc - a function handle to spectrum calculation function.
%       m - the size of the square matrix.
%       tol - the tolerance to use in eigFunc.
%       N - the number of samples to take.
%
%   Outputs:
%       mu - the average number of iterations.
%       var - variance.

    nof_iters = zeros(N,1);  % Initialize an array to store number of iterations for each sample
    rng(0);  % Set seed for reproducibility
    
    for i = 1:N
        A = rand(m);  % Generate random matrix
        
        % Make A as symmetric matrix
        [m, n] = size(A);
        for j = 1:m
            for k = j+1:n
                % Set the element at (j, k) equal to the element at (k, j)
                A(k, j) = A(j, k);
            end
        end
        
        [~, ~, iter] = eigFunc(A, tol);  % Call eigFunc to compute spectrum
        
        nof_iters(i) = iter;  % Store number of iterations
    end
    
    mu = mean(nof_iters);  % Calculate mean
    var = std(nof_iters)^2;  % Calculate variance
end%    bahalulk_final_p3
