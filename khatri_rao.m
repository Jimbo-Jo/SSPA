function C=khatri_rao(A,B)
dimA=size(A);
dimB=size(B);

if dimA(2)~=dimB(2)||length(dimA)>2||length(dimB)>2
    error('Inner matrix dimensions must agree.');
end

C=zeros([dimA(1)*dimB(1),dimA(2)]);
for i=1:dimA(2)
    C(:,i)=kron(A(:,i),B(:,i));
end
end