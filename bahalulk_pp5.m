function [length] = bahalulk_pp5(A, i, j)
%BAHALULK_PP5 calculates the length of the shortest path between two points of a square matrix A and checks if the path length is larger than 15.
%
%   Inputs:
%       A - a real square matrix which represents the graph connecting the two points
%       i - a positive scalar in the range of 1 to size of A, representing the starting point
%       j - a positive scalar in the range of 1 to size of A, representing the ending point
%
%   Outputs:
%       length - The output of the function is the length of the shortest path between the two points i and j. If the path length is larger than 15, an error will be thrown.

    len = 1;                    %initializing different value as count of length of the shortest path between the two points i and j to avoid conflict.
    D = A;                      %making a copy of matrix A into matrix D.
    length = 1;                  %initializing length so that it could return shortest path in case of i,j is not equal to 0.
    
    %iterating till it reaches 15 as its shortest path.
    while len <= 15  
        %will display the length if D(i,j) value is ~= 0.
        if D(i,j) ~= 0 
            disp (length);
            break
        %matrix is being multiplied in the form of square, cube,... till D(i,j) value is ~= 0 and length is incremented for every multiplication takes place.
        elseif D(i,j) == 0
            D = D * A;
            len = len + 1;
        end
        length = len;           %final count of length that has taken place to reach shortest path between the two points i and j.
    end
    
    %if the path length is larger than 15, returns an error using the 'error' function
    if len > 15
        error (length);
    end
end % bahalulk_pp5