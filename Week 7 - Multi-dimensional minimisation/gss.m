function alphaOpt = gss(func,delta,err)

% GOLDEN SECTION SEARCH METHOD %

% Written by: Emre SAYIN
% May 2021
% Matlab Version: R2019a

% This method is used to find the optimum step size for a given step size
% function
% Reference for the algorithm : Arora, J. S. (2017). Introduction to
% optimum design
% Feel free to use with citation 
% Contact: sayine15@itu.edu.tr

% Inputs: function, delta (initial step size), err (error tolerance)
% Output: Optimum step size


% ---- Example usage of the function -----%: 
% func = @(alpha) 2-4*alpha+exp(alpha); %Construct the function
% delta = 0.05;
% err = 0.001;
% optAlpha = gss(func,delta,err); %Find the optimum step size by using
                                  % function

                                                           
gR  = (sqrt(5) + 1)/2; %Golden Ratio
global tau
tau = (sqrt(5) - 1)/2;

%Construct first variable and its value
alpha(1) = delta;
funcVal(1) = func(alpha(1));

bracketingFlag = 0;
optAlphaFlag = 0;
i = 1;

%% Phase I
while bracketingFlag == 0 %While bracketing is not reached
    
    alpha(i+1) = alpha(i) + delta*(gR)^(i); %Calculate alpha
    
    funcVal(i+1) = func(alpha(i+1)); %Calculate corresp. function value
    
    if i >= 2 %After calculating the first three elements
        
        if (funcVal(i) < funcVal(i-1) && funcVal(i) < funcVal(i+1)) %If min
                                                        %existence detected          
            alpha_U = alpha(i+1); %Store alpha_lower
            alpha_L = alpha(i-1); %Store alpha_upper
            
            [I,alpha_a,alpha_b] = updateAlpha_ab(alpha_L,alpha_U);
            
            if I < err
                optAlphaFlag = 1;
            end
            iter = 1; %Add an iteration for the first phase
            bracketingFlag = 1; %Bracketing has been found!
            break
            
        end
        
    end
    
    i = i+1;
end  %End of phase I


%% Phase II
while optAlphaFlag == 0 %While optimum alpha is not found
    
    funcA = func(alpha_a); %Calculate corresp. func value for alpha_a
    funcB = func(alpha_b); %Calculate corresp. func value for alpha_b
    
    if funcA < funcB
        
        %alpha_L = alpha_L;
        alpha_U = alpha_b;
        
    elseif funcA > funcB
        
        alpha_L = alpha_a;
        %alpha_U = alpha_U;
        
    elseif funcA == funcB
        
        alpha_L = alpha_a;
        alpha_U = alpha_b;
    
    end
    
    [I,alpha_a,alpha_b] = updateAlpha_ab(alpha_L,alpha_U);
    
    if I < err %If error is less than given value
        
        optAlphaFlag = 1; %Optimum alpha found!
    
    end
    
    iter = iter + 1; %One can calculate the total number of iterations by using
                     %this variable as well
end %end of Phase II

alphaOpt = 0.5*(alpha_a + alpha_b); %Calculate optimum alpha

%%
    function [I,alphaA,alphaB]= updateAlpha_ab(alphaL,alphaU) %Calculate alpha_a and alpha_b
        
        I = alphaU - alphaL;
        alphaA = alphaL + I*(1-tau);
        alphaB = alphaL + tau*I;
        
    end

end