function [v] = bahalulk_pp4(f,x)
%bahalulk_pp4 is returning the value 'v' by using a anonymous function handle 'f', which evalates at a scalar 'x'
%   input value: f(any anonymous function to be with value of 'x')
%                x(any real number)
%   output value: v(value of the anonymous function 'f' with 'x')

    v = f(x);       %returns the evaluation of f at x as v.
end                 %end of the function.