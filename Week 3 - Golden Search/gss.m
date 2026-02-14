function [a, b, n] = gss(f, a, b, err, N, use_width, fighandle)
% Golden Section Search Method where err is interval with
%  use_width, if true will test b-a. if false will test abs(f(b) - f(a))

figure(fighandle);
hold on

r = (3 - sqrt(5))/2; % GSS Ratio ~ 0.38
n = 0;
fa = f(a);
fb = f(b);
plot(a, fa, "o");
plot(b, fb, "o");

c = a + r * (b - a);
d = b - r * (b - a);
fc = f(c);
fd = f(d);

colororder('glow12');

if use_width
    interval = b - a;
else
    interval = abs(fb - fa);
end

while interval > err

    % pause for animation but as things move on, pause less
    if n < 10
        p = 0.5;
    elseif n < 50
        p = 0.1;
    else
        p = 0.01;
    end
    pause(p);
    
    if fc < fd
        b = d;
        fb = fd;
        d = c;
        fd = fc;
        c = a + r * (b - a);
        fc = f(c);
        plot(b, fb, 'o');
    else
        a = c;
        fa = fc;
        c = d; fc = fd;
        d = b - r * (b - a);
        fd = f(d);
        plot(a, fa, "o");
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
hold off;

end

