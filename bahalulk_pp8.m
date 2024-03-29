function [L, U, P] = bahalulk_pp8(A)
% BAHALULK_PP8 computes the LU decomposition of a square matrix "A" with partial pivoting using the algorithm given in class.
%
%   Inputs:
%       A - the square matrix to decompose
%
%   Outputs:
%       L - the lower triangular matrix of the decomposition
%       U - the upper triangular matrix of the decomposition
%       P - the permutation matrix of the decomposition

    n = size(A,1); % Determine the size of the matrix
    L = eye(n); % Initialize L to identity matrix
    U = A; % Initialize U to A
    P = eye(n); % Initialize P to identity matrix
    
    for k = 1:n-1 % Loop over columns (elimination steps)
        [~, p] = max(abs(U(k:n,k))); % Find the row with the largest pivot
        p = p + k - 1; % Adjust the row index to account for previous steps
        if p ~= k % If the pivot is not on the diagonal
            % Interchange rows k and p in U and P
            U([k,p],k:n) = U([p,k],k:n);
            P([k,p],:) = P([p,k],:);
            if k > 1
                % Interchange rows k and p in L, but only for columns 1:k-1
                L([k,p],1:k-1) = L([p,k],1:k-1);
            end
        end
        for i = k+1:n % Loop over rows below the diagonal
            L(i,k) = U(i,k)/U(k,k); % Compute the multiplier for row i
            U(i,k:n) = U(i,k:n) - L(i,k)*U(k,k:n); % Update row i of U
        end
    end

end % bahalulk_pp8
