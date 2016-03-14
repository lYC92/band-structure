% This code calculate BS of silicon

%% define crystal structure
a0 = 5.431; % A
a = a0/2*(1-eye(3));
a1 = a(:,1);
a2 = a(:,2);
a3 = a(:,3);
V = (a1'*cross(a2,a3));
b1 = 2*pi/a0*(cross(a2,a3))/V;
b2 = 2*pi/a0*(cross(a3,a1))/V;
b3 = 2*pi/a0*(cross(a1,a2))/V;

% reciprocal vector
% G = n1*b1+n2*b2+n3*b3;

%% generate K-point path
i=1;
for m=0:1:10  k(:,i)=[0.5-m/20 0.5-m/20 0.5-m/20] ;i=i+1; end;
% for m=10:1:20 k(:,i)=[(m-10)/10 0 0] ; i=i+1;end;
% for m=20:1:26 k(:,i)=[1 (m-20)/10 0] ; i=i+1;end;
% for m=26:1:30 k(:,i)=[1-(m-25)/20 0.5+(m-25)/20 0] ; i=i+1;end;
% for m=30:1:40 k(:,i)=[(0.75-(m-30)/(40/3)) (0.75-(m-30)/(40/3)) 0] ; i=i+1;end;

%% Hamiltonian
m = 9.11e-31;
hbar = 1.054e-34;
q = 1.6e-19;
const = hbar*hbar/2/m/q;
n = 125;
H = zeros(n);
middle = ceil(n/2);

for k_loop = 1:length(k)

    for i = 1:n
        for j = 1:n
            H(i,j) = const*norm(Ggen(j-middle)+k(:,k_loop)').^2*(i==j)...
                + Vpseudo(Ggen(j-middle-i));
        end
    end
    value(:,k_loop) = eig(H);
end
%%
plot([1:45],value)












