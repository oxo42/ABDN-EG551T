
clear
syms x y
syms f(x,y)
f(x,y) = 5*x^2 - 6*x*y + 5*y^2 %[output:16012bb5]


syms p_x p_y lambda

phi1 = f(p_x+lambda, p_y) %[output:5fde57f9]
phi2 = f(p_x, p_y + lambda) %[output:3eb0e171]
expand(phi1) %[output:505a1d73]

phi_x = 5*lambda^2 + (10*p_x - 6*p_y)*lambda + (5*p_x^2 - 6 * p_x * p_y + 5 * p_y^2) %[output:25971dc8]
phi_y = 5*lambda^2 + (10*p_y - 6*p_x)*lambda + (5*p_x^2 - 6 * p_x * p_y + 5 * p_y^2) %[output:155b224d]

F = matlabFunction(f) %[output:342ade9e]
phi_x = matlabFunction(phi_x) %[output:51f4e5b3]
phi_y = matlabFunction(phi_y) %[output:98947325]

p = [-1 -1];
f = @(lambda) phi_x(lambda, p(1), p(2));
[p(1), b, n] = gss(f, -1, 2, 0.0001) %[output:782aa48e] %[output:30df71a1] %[output:27a65095]

f = @(lambda) phi_y(lambda, p(1), p(2));
[a, b, n] = gss(f, -1, 2, 0.0001, 1000, true, []) %[output:36a843d9] %[output:549039ec] %[output:62e93ba5]
%%
clear 
syms x y
syms f(x,y)
f(x,y) = 5*x^2 - 6*x*y + 5*y^2 %[output:0cede491]

p = [-1 -1];
[min, count] = successive_descent(f, p) %[output:81733a12] %[output:178d88ed]

function [p, count] = successive_descent(f, p, dstep, step_size, tol)
arguments
    f % The function
    p % initial guess
    dstep = 0.0001 % small step size to test direction
    step_size= 100 % big step size that will go over the minimum
    tol = 0.01 % tolerance
end
args = argnames(f);
syms lambda
syms g(lambda)
i = eye(length(args));
gap = tol+1;
count = 0;
while gap > tol || count 
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
        [next, b, gss_count] = gss(g, l, l+step, tol);
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
%[output:5fde57f9]
%   data: {"dataType":"symbolic","outputData":{"name":"phi1","value":"5\\,{{\\left(\\lambda +p_x \\right)}}^2 -6\\,p_y \\,{\\left(\\lambda +p_x \\right)}+5\\,{p_y }^2"}}
%---
%[output:3eb0e171]
%   data: {"dataType":"symbolic","outputData":{"name":"phi2","value":"5\\,{{\\left(\\lambda +p_y \\right)}}^2 -6\\,p_x \\,{\\left(\\lambda +p_y \\right)}+5\\,{p_x }^2"}}
%---
%[output:505a1d73]
%   data: {"dataType":"symbolic","outputData":{"name":"ans","value":"5\\,\\lambda^2 +10\\,\\lambda \\,p_x -6\\,\\lambda \\,p_y +5\\,{p_x }^2 -6\\,p_x \\,p_y +5\\,{p_y }^2"}}
%---
%[output:25971dc8]
%   data: {"dataType":"symbolic","outputData":{"name":"phi_x","value":"\\lambda \\,{\\left(10\\,p_x -6\\,p_y \\right)}-6\\,p_x \\,p_y +5\\,\\lambda^2 +5\\,{p_x }^2 +5\\,{p_y }^2"}}
%---
%[output:155b224d]
%   data: {"dataType":"symbolic","outputData":{"name":"phi_y","value":"5\\,\\lambda^2 -\\lambda \\,{\\left(6\\,p_x -10\\,p_y \\right)}-6\\,p_x \\,p_y +5\\,{p_x }^2 +5\\,{p_y }^2"}}
%---
%[output:342ade9e]
%   data: {"dataType":"textualVariable","outputData":{"header":"function_handle with value:","name":"F","value":"    @(x,y)x.*y.*-6.0+x.^2.*5.0+y.^2.*5.0\n"}}
%---
%[output:51f4e5b3]
%   data: {"dataType":"textualVariable","outputData":{"header":"function_handle with value:","name":"phi_x","value":"    @(lambda,p_x,p_y)p_x.*p_y.*-6.0+lambda.*(p_x.*1.0e+1-p_y.*6.0)+lambda.^2.*5.0+p_x.^2.*5.0+p_y.^2.*5.0\n"}}
%---
%[output:98947325]
%   data: {"dataType":"textualVariable","outputData":{"header":"function_handle with value:","name":"phi_y","value":"    @(lambda,p_x,p_y)p_x.*p_y.*-6.0-lambda.*(p_x.*6.0-p_y.*1.0e+1)+lambda.^2.*5.0+p_x.^2.*5.0+p_y.^2.*5.0\n"}}
%---
%[output:782aa48e]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"p","rows":1,"type":"double","value":[["0.4000","-1.0000"]]}}
%---
%[output:30df71a1]
%   data: {"dataType":"textualVariable","outputData":{"name":"b","value":"0.4000"}}
%---
%[output:27a65095]
%   data: {"dataType":"textualVariable","outputData":{"name":"n","value":"22"}}
%---
%[output:36a843d9]
%   data: {"dataType":"textualVariable","outputData":{"name":"a","value":"1.2399"}}
%---
%[output:549039ec]
%   data: {"dataType":"textualVariable","outputData":{"name":"b","value":"1.2400"}}
%---
%[output:62e93ba5]
%   data: {"dataType":"textualVariable","outputData":{"name":"n","value":"22"}}
%---
%[output:0cede491]
%   data: {"dataType":"symbolic","outputData":{"name":"f(x, y)","value":"5\\,x^2 -6\\,x\\,y+5\\,y^2"}}
%---
%[output:81733a12]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"min","rows":1,"type":"double","value":[["0.0451","0.0141"]]}}
%---
%[output:178d88ed]
%   data: {"dataType":"textualVariable","outputData":{"name":"count","value":"267"}}
%---
