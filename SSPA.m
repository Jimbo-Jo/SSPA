function [theta,error] = SSPA(X,d,lambda)

[Nm, Nf]=size(X);

%% Construct Synthetic Sparse Planar Array
N = Nf*(Nm-1)+1;        % SSPA's number of sensors: N*Nf
U = zeros(N,Nf);        % construct SSPA
Mask = zeros(N,Nf);
for i = 1:Nm
    for j = 1:Nf
        U(j*(i-1)+1,j) = X(i,j);
        Mask(j*(i-1)+1,j) = 1;
    end
end

%% DOA estimation
beta      = 0.02;
alpha     = 0.002;
[A_hat, ~, error] = Funk_SVD(U, 1, alpha, beta, Mask);
A0 = A_hat(1:end-1,:);
A1 = A_hat(2:end,:);
% simplified
Phi_hat = A0\A1;
angles = angle(Phi_hat);
theta = acosd(angles / (-2*pi*(d/lambda)));
% ESPRIT
% Phi_hat = (A0'*A0)\A0'*A1;
% [~, D_psi] = eig(Phi_hat);
% angles = angle(diag(D_psi));
% theta = acosd(angles / (-2*pi*(d/lambda)));

end

