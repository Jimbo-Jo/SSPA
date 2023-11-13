function [U, V, E] = Funk_SVD(X, k, alpha, beta, Mask)

% Initialize the U and V matrices
[u,S ,v] = svd(X);
[m, n] = size(X);
U = u(:,1:k)*S(1:k,1:k);
V = (S(1:k,1:k)*v(:,1:k)')';% 

% Calculate the initial error
e = norm(X - U*V', 'fro');

% Gradient descent iteratively updates the U and V matrices
iter = 1;
while (1)
    for i = 1:m
        for j = 1:n
            if abs(X(i,j)) ~= 0
                eij = X(i,j) - Mask(i,j)*(U(i,:) * V(j,:)');
                U(i,:) = U(i,:) + alpha * (2*eij * V(j,:)- beta * U(i,:));
                V(j,:) = V(j,:) + alpha * (2*eij * U(i,:)- beta * V(j,:));
            end
        end
    end
     
    old_e = e;
    e = norm(X - Mask.*(U*V'), 'fro')+ beta/2*(norm(U, 'fro')+norm(V, 'fro')) ;
    E(iter) = e;
    iter = iter+1;
    
    % Determine if it converges
    if abs(e-old_e) < 1e-5
        break;
    end
end

end
