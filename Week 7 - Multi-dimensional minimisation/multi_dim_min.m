clear 
syms x y
syms f(x,y)
f(x,y) = 5*x^2 - 6*x*y + 5*y^2 %[output:16012bb5]

p = [-1 -1];
[min, count] = successive_descent(f, p, 0.1, 2) %[output:305b0115] %[output:3198efbc]

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
i = eye(length(args));
gap = tol+1;
count = 0;
while gap > tol && count < 1000
    old_p = p;
    for n=1:length(args)
        % gives a nx1 matrix of args to pass to the function
        % looks like
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
        [next, b, gss_count] = gss(g, l, l+step, 0.0001);
        p(n) = b;
            % [p direction gss_count]
    end
    gap = max(abs(p - old_p));
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
%[output:305b0115]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"min","rows":1,"type":"double","value":[["-0.9361","-0.7332"]]}}
%---
%[output:3198efbc]
%   data: {"dataType":"textualVariable","outputData":{"name":"count","value":"1000"}}
%---
