function [f] = bahalulk_pp3(n)
%bahalulk_pp3 is giving the fatorial of 'n'
% input value: n(any real value)
% output value: f(factorial value of input value 'n')

    f = 1;          %initializing the output 'f'
    i = 1;          %initializing the output 'i'
    while i <= n    %loop runs until 'i' will either be less or equal to 'n'
        f = f*i;    %performing factorial operation using multiplication
        i = i+1;    %incrimeting i value till it reaches n value
    end             %end of for loop
end                 %end of the function