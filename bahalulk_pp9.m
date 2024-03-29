function [x, iter] = bahalulk_pp9(g, x0, eps, delta, itermax)
%BAHALULK_PP9 method to determine the root of a function g(x) using an initial guess of x0.
%
%   Inputs:
%       g - A function which returns f, fx = g(x).
%       x0 - The initial guess at the root.
%       eps - The tolerance to use.
%       delta - Criteria for divergence.
%       itermax - The maximum number of iterations.
%
%   Outputs:
%       x - The root of the function g
%       iter - The number of iterations required to obtain the root.

    x = x0; % Initialize x to x0
    for iter = 0:itermax-1  % Loop for itermax number of iterations
        [f, fx] = g(x); % Evaluate function and derivative at x
        dx = f / fx;    % Calculate the full step using Newton-Raphson formula
        if abs(dx) < eps    % Check for convergence
            return; % Return root and number of iterations
        end
        if abs(dx) > delta  % Check for divergence
            error("Error: Divergence"); % Raise exception if method is diverging
        end
        x = x - dx; % Update x by subtracting full step
    end
    error("Error: Maximum Number of Iterations");   % Raise exception if maximum number of iterations is exceeded
end % bahalulk_pp9
