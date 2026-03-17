function lambda = linmin(func, P, hi, eps)
%This function performs line minimisation in multidimensional space.
%it minimises from point P along line hi, and returns Lambda (the value by
%which hi must be multiplied for P + Lambda*hi = minimum point along hi from P)


%initial Bracketing: (Adapted from Numerical Recipies In C)
%this allows guessing of brackets prior to GSS not to be worried about
%as it automates the initial bracketing process.

ax = 1e-8;
bx = -1e-8;
dummy = 0;
littlenum = 1e-100;
GOLD = 1.618034;
GLIMIT = 100;

fa = feval(func, P + ax*hi, 0);
fb = feval(func, P + bx*hi, 0);

if fb > fa
    dummy = ax;
    ax = bx;
    bx = dummy;     %swap ax, bx
    
    dummy = fa;
    fa = fb;
    fb = dummy;     %swap fa, fb
end

cx = bx+GOLD*(bx - ax);
fc = feval(func, P+cx*hi, 0);

while fb > fc
    r = (bx - ax)*(fb - fc);
    q = (bx - cx)*(fb - fa);

    if abs(q-r) > littlenum
        u = bx - ((bx - cx) * q - (bx - ax) * r)/(2* abs(q-r)*((q-r)/abs(q-r)));
    else
        u = bx - ((bx - cx) * q - (bx - ax) * r)/(2* littlenum*((q-r)/abs(q-r)));
    end
    ulim = bx+GLIMIT*(cx - bx);
    
    if (bx - u)*(u - cx) > 0
        fu = feval(func, P+u*hi, 0);
        if fu < fc
            ax = bx;
            bx = u;
            fa = fb;
            fb = fu;
            break
        elseif fu > fb
            cx = u;
            fc = fu;
            break
        end
        u = cx+GOLD*(cx-bx);
        fu = feval(func, P+u.*hi, 0);
    elseif (cx - u)*(u-ulim) > 0
        fu = feval(func, P+u.*hi, 0);
        if fu < fc
            bx = cx;
            cx = u;
            u = cx+GOLD*(cx-bx);
            fb = fc;
            fc = fu;
            fu = feval(func, P+u.*hi, 0);
        end
    elseif (u - ulim)*(ulim - cx) >= 0
        u = ulim;
        fu = feval(func, P+u.*hi, 0);
    else
        u = cx+GOLD*(cx - bx);
        fu = feval(func, P+u.*hi, 0);
    end
    ax = bx;
    bx = cx;
    cx = u;
    fa = fb;
    fb = fc;
    fc = fu;
end
%ax, bx and cx now bracket a minimum
%All of the above section puts a bracket round a minimum ready for the 
%(following) Golden Section Search:

%------------Golden Section Search:

N = 2000;
redfact = (-1+sqrt(5))/2;
x1 = redfact*ax+(1-redfact)*cx;
fx1 = feval(func, P+x1.*hi, 0);         %Main thing here is that function in 
x2 = (1 - redfact)*ax +redfact*cx;      %multidimensions is reduced to function
                                        %                   _        __
fx2 = feval(func, P+x2.*hi, 0);         %of one dimension. (P+Lambda*hi)
                                        %with use of Lambda (x1 and x2)
for i = 1:N-2
    if fx1 < fx2
        cx = x2;
        x2 = x1;
        fx2 = fx1;
        x1 = redfact*ax+(1 - redfact)*cx;
        fx1 = feval(func, P+x1.*hi, 0);
    else
        ax = x1;
        x1 = x2;
        fx1 = fx2;
        x2 = (1 - redfact)*ax+redfact*cx;
        fx2 = feval(func, P+x2.*hi, 0);
    end
    if abs(cx-ax) < eps
        break
    end
end

lambda = ((ax+cx)/2);   %Assigning the variable specified in func. declaration
