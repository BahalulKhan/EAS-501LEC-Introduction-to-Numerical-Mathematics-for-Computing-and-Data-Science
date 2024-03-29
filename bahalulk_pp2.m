function [f] = bahalulk_pp2(n)
%bahalulk_pp2 is giving the fatorial of 'n'
% input value: n(any real value)
% output value: f(factorial value of input value 'n')

    f = 1;          %initializing the output 'f'
    for i = 1:1:n   %iteration from 1 with a increment of 1 till 'n'
        f = f*i;    %performing factorial operation using multiplication                                                                                                        
    end             %end of for loop
end                 %end of the function