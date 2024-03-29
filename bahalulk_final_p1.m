function [D, Q, iter] = bahalulk_final_p1(A, tol)
%BAHALULK_FINAL_P1 Computes pure QR algorithm.
%
%   Inputs:
%       A - real and symmetric matrix.
%       tol - The tolerance for convergence.
%
%   Outputs:
%       D - the matrix that contains eigen values of A on the diagonal.
%       Q - unitary matrix.
%       iter - the number of iterations necessary for convergence.

    n = size(A, 1);  % Get the size of the matrix A
    Q = eye(n);  % Initialize the unitary matrix Q as identity matrix
    D = A;  % Initialize D as A
    iter = 0;  % Initialize the iteration counter

    while true
        iter = iter + 1;  % Increment the iteration counter

        % Perform QR decomposition on matrix D
        [Qk, Rk] = qr(D);

        % Update D to get closer to upper triangular form
        D = Rk * Qk;

        % Update Q by multiplying with Qk
        Q = Q * Qk;

        % Compute the sub-diagonal and diagonal of D
        Tk_0 = diag(D);
        Tk_minus_1 = diag(D, -1);

        % Compute the norms of sub-diagonal and diagonal
        Tk_minus_1_norm = norm(Tk_minus_1, 2);
        Tk_0_norm = norm(Tk_0, 2);

        % Compute the convergence ratio
        convergence_ratio = Tk_minus_1_norm / Tk_0_norm;

        % Check convergence
        if convergence_ratio < tol
            break;  % Exit the loop if convergence criterion is met
        end
    end
end%    bahalulk_final_p1
