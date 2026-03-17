function [Min,All] = Fl_Re(Iter, eps, P)
%Fletcher-Reeves Algorithm 
%
%usage:
%       <Vector_Point> Min ,[Array of Vectors] All = Fl_Re(<scalar> IterationMax, 
%                                   <scalar> Accuracy
%                                   <vector> Initial point)
%
%returns minimum in vector point form

func = @NFunc;                      %point to Function to be solved
                                    %in this case, Nfunc.m

gi = -feval(func, P, 1);            %Evaluate gradient vector @ P
hi = gi;                            %we now have initial h and g 
                                    %direction vetors
for x = 1:Iter;     %Loop to max Iteration
    
    lambda = linmin(func, P, hi, eps);    %Perform Line Minimisation along hi
                                          %on function 'func'
    P2 = P + lambda.*hi;                  %next P calculated (minimum point on hi)
    gi_2 = - feval(func, P2, 1);           %gradient at point
    gamma = dot(gi_2, gi_2)/dot(gi, gi);  %gamma for  point
    %hi = lambda*hi;                       %update hi
    hi = gi_2 + gamma.*hi;                %calculate next hi
    gi = gi_2;                            %get next gi ready for use
    
    temp = 0;                             %zero temp
    for zc = 1:length(P)                  %and use to add all components of P-P2
        temp = temp+abs(P(zc)-P2(zc));    %ready for accuracy check
    end     %I'm sure there's a command to add all components of a vector, I just
            %can't remember what it is!!

    P = P2;                               %update P for next iteration
    All(x,:)=P;    
    if temp < eps                         %this is not ideal, but ensures
                                          %sum of all errors is less than 
                                          %accuracy specifier
        fprintf('finished before all iterations');
        break                             %exit For loop if condition met
    end
end
Min = P;    %output readied (to match function declaration at top of file)