function [r, J] = bahalulk_midterm_p2(af, x, y)
%BAHALULK_MIDTERM_P2 Finding the Jacobian matrix by considering a function 'a1sin(a2x)+a3cos(a4x)' to a set of data .
% 
%   Inputs:
%       af - the coefficient list.
%       x - the x-locations.
%       y - the y-locations.
%
%   Outputs:
%       r - the residual vector.
%       J - the Jacobian matrix.

    % assigning the coefficient values from a column vector af to a1,a2,a3 and a4
    a1 = af(1);
    a2 = af(2);
    a3 = af(3);
    a4 = af(4);
    r = a1*sin(a2*x) + a3*cos(a4*x) - y;   % residual vector using the given function
    % the partial derivatives are written column-wise to form the Jacobian matrix.
    J = [sin(a2*x), a1*x.*cos(a2*x), cos(a4*x), -a3*x.*sin(a4*x)];
end % bahalulk_midterm_p2