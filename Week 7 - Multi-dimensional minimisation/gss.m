function [a, b, n] = gss(f, a, b, err, N, use_width, fighandle)
arguments
    f
    a
    b
    err
    N = 1000
    use_width = true
    fighandle = []
end
% Golden Section Search Method where err is interval with
%  use_width, if true will test b-a. if false will test abs(f(b) - f(a))

dofig = ~isempty(fighandle);
if dofig
    figure(fighandle);
    hold on
    colororder('glow12');
    
end

r = (3 - sqrt(5))/2; % GSS Ratio ~ 0.38
n = 0;
fa = f(a);
fb = f(b);
if dofig
    plot(a, fa, "o");
    plot(b, fb, "o");
end

c = a + r * (b - a);
d = b - r * (b - a);
fc = f(c);
fd = f(d);


if use_width
    interval = b - a;
else
    interval = abs(fb - fa);
end

while interval > err

    % pause for animation but as things move on, pause less
    if dofig
        if n < 10
            p = 0.5;
        elseif n < 50
            p = 0.1;
        else
            p = 0.01;
        end
        pause(p);
    end
    
    if fc < fd
        b = d;
        fb = fd;
        d = c;
        fd = fc;
        c = a + r * (b - a);
        fc = f(c);
        if dofig
            plot(b, fb, 'o');
        end
    else
        a = c;
        fa = fc;
        c = d; fc = fd;
        d = b - r * (b - a);
        fd = f(d);
        if dofig
            plot(a, fa, "o");
        end
    end
    n = n + 1;
    if n > N
        disp("More than " + N + " Bailing");
        break
    end
    if use_width
        interval = b - a;
    else
        interval = abs(fb - fa);
    end
end
if dofig
    hold off;
end

end

