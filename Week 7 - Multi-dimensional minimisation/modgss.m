function [a, b] = modgss (func, a, b , x, index, eps, N)
%Golden Section Search...
% [a, b] = gss (a, b ,eps, N)
%
%'a', 'b' are brackets to minima(or maxima)
% x is the starting point of the search
% index is the index of the co-ordinate we are changing
%eps = accuracy, N = max evaluations
if b<a
    tmpb=b;
    tmpa=a;
    a=tmpb;
    b=tmpa;
end
gr = (3-sqrt(5))/2; 
c = a + gr*(b-a); 
newc=x;
newc(index)=c;
fc = func(newc); 
d = b-gr*(b-a); 
newd=x;
newd(index)=d;
fd = func(newd); %Golden Ratio bit
for i = 1:N-2 
    if fc < fd 
        b = d; 
        d = c; 
        fd = fc; 
        c = a+gr*(b-a); 
        newc(index)=c;
        fc = func(newc); %this is the main loop
        %if f(c) is a better choice than f(d)
        %move b to d
        %move d to c
        %(and keep F(c))
        %calculate a new c
        %and evaluate function at it
    else
        a = c; %move a to c
        c = d; %move d to c
        fc = fd; %keep f(d)
        d = b-gr*(b-a); %calculate new d
        newd=x;
        newd(index)=d;
        fd = func(newd); %and evaluate function at it
    end
    if (abs(b-a)<eps) 
        return
        %test if within accuracy
    end
end