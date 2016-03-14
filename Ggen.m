function [G]=Ggen(m)
%This function generates one G vector
%G is the reciprocal lattice vector
%One G is generated per hamiltonian matrix element
%The function argument is only one number, m
%m=i if i==j, else m=i-j


% a = str2num(dec2base(m,5));
% h = floor(a/100)-2;
% l = floor(rem(a,100)/10)-2;
% k = rem(a,10)-2;
lim = 5;
n = lim^3-1;

h=floor((m+n/2)/(lim^2))-floor(lim/2);
k=floor(mod((m+n/2),lim^2)/lim)-floor(lim/2);
l=mod((m+n/2),lim)-floor(lim/2);

b1=[-1 1 1];  %basis vectors
b2=[1 -1 1];
b3=[1 1 -1];

B1 = h*b1;
B2 = k*b2;
B3 = l*b3;

G(1)=(B1(1)+B2(1)+B3(1)) ;
G(2)=(B1(2)+B2(2)+B3(2)) ;
G(3)=(B1(3)+B2(3)+B3(3)) ;

G=[G(1) G(2) G(3)];
