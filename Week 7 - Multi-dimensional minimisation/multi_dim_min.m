
clear
syms x y
syms f(x,y)
f(x,y) = 5*x^2 - 6*x*y + 5*y^2 %[output:16012bb5]


% syms p_x p_y lambda
% 
% phi1 = f(p_x+lambda, p_y)
% phi2 = f(p_x, p_y + lambda)
% expand(phi1)
% 
% phi_x = 5*lambda^2 + (10*p_x - 6*p_y)*lambda + (5*p_x^2 - 6 * p_x * p_y + 5 * p_y^2)
% phi_y = 5*lambda^2 + (10*p_y - 6*p_x)*lambda + (5*p_x^2 - 6 * p_x * p_y + 5 * p_y^2)
% 
% F = matlabFunction(f)
% phi_x = matlabFunction(phi_x)
% phi_y = matlabFunction(phi_y)
% 
% p = [-1 -1];
% f = @(lambda) phi_x(lambda, p(1), p(2));
% [p(1), b, n] = gss(f, -1, 2, 0.0001)
% 
% f = @(lambda) phi_y(lambda, p(1), p(2));
% [p(2), b, n] = gss(f, -1, 2, 0.0001, 1000, true, []);
% 
% f(x,y) = 5*x^2 - 6*x*y + 5*y^2

p = [-1 -1];
[min, count] = successive_descent(f, p) %[output:688fcae9] %[output:916ecb3a]

function [p, count] = successive_descent(f, p, dstep, step_size, tol)
arguments
    f % The function
    p % initial guess
    dstep = 0.0001 % small step size to test direction
    step_size= 100 % big step size that will go over the minimum
    tol = 0.00001 % tolerance
end
args = argnames(f);
syms lambda
syms g(lambda)
i = eye(length(args));
gap = tol+1;
count = 0;
while gap > tol
    for n=1:length(args)
        g_args = (lambda * i(:, n))+p';
        C = num2cell(g_args);
        g(lambda) = f(C{:});
        % this get's the nth parameter from p which will be our initial guess
        l = p(n);
        direction = 1;
        if g(l) < g(l + dstep)
            % if we take a small step and it is smaller we're going the
            % wrong way
            direction = -1;
        end
        step = step_size * direction;
        next = gss(g, l, l+step, tol);
        gap = abs(next - p(n));
        p(n) = next;
    end
    count = count + 1;
end
end
%%
% [X,Y] = meshgrid(linspace(-5, 5, 20));
% Z = F(X, Y);
% surf(X,Y,Z)

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:16012bb5]
%   data: {"dataType":"symbolic","outputData":{"name":"f(x, y)","value":"5\\,x^2 -6\\,x\\,y+5\\,y^2"}}
%---
%[output:688fcae9]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"min","rows":1,"type":"double","value":[["0.4000","1.2400"]]}}
%---
%[output:916ecb3a]
%   data: {"dataType":"textualVariable","outputData":{"name":"count","value":"2"}}
%---
