function [R] = bahalulk_pp6(A)
%BAHALULK_PP6 performing gaussian elimination with pivoting to obtain the reduced row echelon form of a matrix.
% 
%   Inputs:
%       A - the matrix.
%
%   Outputs:
%       R - the reduced row echelon form of A.

    [m, n] = size(A);       % get the size of the matrix A.
    row = 1;                % initialize the current row number to 1.
    column = 1;             % initialize the current column number to 1.
    
    % when rows and columns still need to be removed:
    while (row <= m && column <= n)
        [max_value, max_index] = max(abs(A(row:m, column)));    % starting with row i locate the index of the jth columns highest absolute value.%
        max_index = max_index + row - 1;                        % to obtain the absolute index of the highest value in every column, multiply the current row index by the maximum value index.
        % go to the next column if the maximum value is 0.
        if (max_value == 0)
            column = column + 1;
        % to make the maximum value the pivot element for the current column instead, swap the current row with the row with the maximum value.
        else
            A([row max_index], column:n) = A([max_index row], column:n);        % i and maximum index should be switched.
            A(row, column:n) = A(row, column:n) / A(row, column);               % the pivot element is divided by the current row to equal 1.
            % to get rid of every row in the current column, use the current row.
            for k = [1:row-1 row+1:m]
                elemination_factor = A(k, column) / A(row, column);
                A(k, column:n) = A(k, column:n) - elemination_factor * A(row, column:n);
            end
            row = row + 1;              % incrementing to the next row.
            column = column + 1;        % incrementing to the next column.
        end 
    end
    
    % update the elements below the pivot value to zero.
    for k = 1:m
        for l = 1:n
            if (A(k,l) ~= 0)
                A(k,:) = A(k,:) / A(k,l);
                break
            end
        end
        for row = [1:k-1 k+1:m]
            A(row,:) = A(row,:) - A(row,l) * A(k,:);
        end
    end
    
    tolerance = 1e-10;              % make a rounding error to tolerance value.
    A(abs(A) < tolerance) = 0;      % if there are any more rounding errors produced during the elimination phase, round the elements to zero once more.
    R = A;                          % final output of the matrix in reduced row echelon form.
end % bahalulk_pp6