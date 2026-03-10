function y = model_func_exp(x, p, k)
% y = model_func_exp(x, p, k)
% y - output y-value
% x - input x-value
% k - defines differentiation order
if k==0 
    y = p(1)*exp(p(2)*x);
elseif k == 1
    y = exp(p(2)*x);
elseif k == 2
    y = p(1) * x * exp(p(2)*x);
else
    error("This function has only two p parameters")
end
