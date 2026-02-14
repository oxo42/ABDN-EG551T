f = @(x) x .* (x - 1);

fig = figure; %[output:152c43e7]
xs = linspace(-0.1, 2.1, 100);
plot(xs, f(xs)); %[output:152c43e7]

[a, b, n] = gss(f, 0, 2, 0.001, 1000, true, fig); %[output:152c43e7]
a %[output:4a9de43a]
b %[output:5629caf0]
n %[output:44492bb5]


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":40}
%---
%[output:152c43e7]
%   data: {"dataType":"image","outputData":{"height":419.75986277873062,"width":560}}
%---
%[output:4a9de43a]
%   data: {"dataType":"textualVariable","outputData":{"name":"a","value":"0.4994"}}
%---
%[output:5629caf0]
%   data: {"dataType":"textualVariable","outputData":{"name":"b","value":"0.5003"}}
%---
%[output:44492bb5]
%   data: {"dataType":"textualVariable","outputData":{"name":"n","value":"16"}}
%---
