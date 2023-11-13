function Signal = Generate_signal(thetas,fre,snap,par,SNR,ifnosie)

% Parameters
c      = par.c;          % speed of sound
d      = par.d;          % intersensor spacing
Nm     = par.Nm;         % number of sensors
f      = fre;            % frequency
Nf     = length(f);      % number of frequency
R      = length(thetas); % number of resoure

S = rand(snap,R);
Y = zeros(Nm,Nf,snap);
X_f = randn(1, Nf) + 1j * randn(1, Nf);
X_f = X_f ./ norm(X_f); %frequency amplitude
for r = 1:R
    A = exp(-1i*2*pi*d/c*cosd(thetas(r))*(0:Nm-1)'*f); %array manifold
    X = khatri_rao(A,X_f);
    for i = 1:snap
        Y(:,:,i) = Y(:,:,i)+X*S(i,r);
    end
end

if(ifnosie)
    Signal=noisy(Y,SNR);
else
    Signal=Y;
end

end

