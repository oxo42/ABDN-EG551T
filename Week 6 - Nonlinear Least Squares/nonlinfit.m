function p = nonlinfit(x,y,p0,tol)
% function call: p = nonlinfit(x,y,p0,tol)
% p - output row of optimised parameters
% x - input row of x-data
% y - input row of y-data
% p0 - input row of initial parameters
% tol - tolerance

N = length(x);

% Choose a model function:
f = @model_func_exp;
%f = @model_func_lin;

% F0 - vector F0 contains the y-data
F0 = y;

% M - number of parameters
M = length(p0);

% p - parameter vector, initialised to be p0
p = p0 % displayed

% norm_dp is the norm of the increment parameter vector p
% and is initialised to be greater than tol so that the
% iteration will be done at least once
norm_dp = 10*tol;

while norm_dp > tol
    for i = 1:N     %loop through each data point
        F(i) = f(x(i), p, 0);   %calculate estimate of exp function
        for j = 1:M     %loop through each parameter
            J(i,j) = f(x(i), p, j);     %and calculate elements of Jacobian
                                        % by estimating partial derivative
                                        %value for this parameter
        end
    end
    H = J'*J;           %calculate estimate of Hessian based on Jacobian
    b = -J'*(F-F0)';    %calculate elements of b vector
    dp = (H\b)';        %estimate change for new parameter values
    norm_dp=sqrt(dp*dp');   %estimate error for tolerance
    p = p + dp % displayed for each iteration
end



