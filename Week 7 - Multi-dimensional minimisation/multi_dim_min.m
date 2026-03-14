clear 
syms x y
syms f(x,y)
f(x,y) = 5*x^2 - 6*x*y + 5*y^2 %[output:16012bb5]

p = [-1 -1];
[min, count] = successive_descent(f, p, 0.1, 2) %[output:79e722c3] %[output:3e1f1441] %[output:6b86bdc8] %[output:0508730c]

function [p, count] = successive_descent(f, p, tol, step_size, dstep)
arguments
    f % The function
    p % initial guess
    tol = 0.01 % tolerance
    step_size = 100 % big step size that will go over the minimum
    dstep = 0.0001 % small step size to test direction
end
args = argnames(f);
syms lambda
syms g(lambda)
N = length(args);
i = eye(N);
gap = tol+1;
count = 0;
while gap > tol && count < 1000
    old_p = p;
    for n=1:N
        % gives a nx1 matrix of args to pass to the function
        % looks like
        g_args = (lambda * i(:, n))+p';
        C = num2cell(g_args);
        g(lambda) = f(C{:});
        G = matlabFunction(g);
        % this get's the nth parameter from p which will be our initial guess
        l = p(n);
        direction = 1;
        if G(l) < G(l + dstep)
            % if we take a small step and it is smaller we're going the
            % wrong way
            direction = -1;
        end
        % step = step_size * direction;
        next = gss(G, 0.05, 0.01);
        p(n) = next;
        [p direction]
    end
    gap = max(abs(p - old_p))
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
%[output:79e722c3]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"ans","rows":1,"type":"double","value":[["0.4009","-1.0000","1.0000"]]}}
%---
%[output:3e1f1441]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"ans","rows":1,"type":"double","value":[["0.4009","1.2391","1.0000"]]}}
%---
%[output:6b86bdc8]
%   data: {"dataType":"textualVariable","outputData":{"name":"gap","value":"2.2391"}}
%---
%[output:0508730c]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"ans","rows":1,"type":"double","value":[["0.3418","1.2391","-1.0000"]]}}
%---
