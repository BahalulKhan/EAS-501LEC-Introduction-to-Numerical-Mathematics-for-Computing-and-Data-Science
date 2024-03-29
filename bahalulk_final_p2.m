function [D, Q, iter] = bahalulk_final_p2(A, tol)
%BAHALULK_FINAL_P2 Computes QR algorithm with the Wilkinson shift.
%
%   Inputs:
%       A - real and symmetric matrix.
%       tol - The tolerance for convergence.
%
%   Outputs:
%       D - the matrix that contains eigenvalues of A on the diagonal.
%       Q - unitary matrix.
%       iter - the number of iterations necessary for convergence.

    n = size(A, 1);  % Get the size of the matrix A
    Q = eye(n);  % Initialize the unitary matrix Q
    iter = 0;  % Initialize the iteration count
    D = A;  % Initialize D as the input matrix A

    while true
        iter = iter + 1;  % Increment the iteration count

        % Compute the lower-right portion of D
        lower_right_portion = D(n-1:n, n-1:n);

        % Compute the coefficients for the characteristic equation
        coeff = [1, -trace(lower_right_portion), det(lower_right_portion)];

        % Find the eigenvalues of the lower-right portion
        eigenvalues = roots(coeff);
        mu1 = eigenvalues(1);
        mu2 = eigenvalues(2);

        % Determine the Wilkinson shift
        if abs(mu1 - D(n, n)) < abs(mu2 - D(n, n))
            mu_k = mu1;
        else
            mu_k = mu2;
        end

        D = D - mu_k * eye(n);  % Apply the shift to D
        [Qk, Rk] = qr(D);  % Compute the QR decomposition of D
        D = Rk * Qk + mu_k * eye(n);  % Update D using the shift
        Q = Q * Qk;  % Update Q by multiplying with Qk

        % Compute the norms of the subdiagonal and diagonal of D
        Tk_0 = diag(D);
        Tk_minus_1 = diag(D, -1);
        Tk_minus_1_norm = norm(Tk_minus_1, 2);
        Tk_0_norm = norm(Tk_0, 2);

        % Compute the convergence ratio
        convergence_ratio = Tk_minus_1_norm / Tk_0_norm;

        % Check for convergence
        if convergence_ratio < tol
            break;
        end
    end
end%    bahalulk_final_p2
