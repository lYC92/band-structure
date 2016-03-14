function k = kpoints(pos,n)

[a,nkpt] = size(pos);
for i = 1:nkpt-1
    AB = zeros(3,1);
    dx = (pos(:,i+1) - pos(:,i)) / n;
    AB = repmat(dx,1,n);
    AB(:,1) = pos(:,i);
    k(:,(i-1)*n+1:i*n) = cumsum(AB,2);
end
k(:,(i)*n+1) = pos(:,end);
    


