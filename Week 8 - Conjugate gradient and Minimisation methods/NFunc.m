function out = NFunc(x, mode)
%2D Function File (for Fletcher Reeves)
%<scalar/vector>out = NFunc(<Vector x, y>, <scalar mode>)
%
%if mode = 0, out is scalar value of equation, otherwise 
%out is vector of partial derivatives (Gradient vector)

if mode == 0                    %non differentiated form
    %out = x(1)^2 + x(1)*x(2) + 3*x(2)^2 - 2*x(1)-x(2)+1;
    out=(1-x(1))^2+100*(x(2)-x(1)^2)^2;
else
    %out(1) = 2*x(1)+x(2)-2;     %Differentiated WRT x(1)
    %out(2) = x(1)+6*x(2)-1;     %Differentiated WRT x(2)

    out(1)=400*x(1)^3+(2-400*x(2))*x(1)-2;
   out(2)=200*(x(2)-x(1)^2);
end