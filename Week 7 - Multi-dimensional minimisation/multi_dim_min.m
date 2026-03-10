clear
syms x y
f = 5*x^2 - 6*x*y + 5*y^2
F = matlabFunction(f)

%%
[X,Y] = meshgrid(linspace(-5, 5, 20));
Z = F(X, Y);
surf(X,Y,Z)


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
