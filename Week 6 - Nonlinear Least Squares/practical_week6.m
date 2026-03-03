xs = [0 0.4 0.8 1.2 1.6 2.0] %[output:09edc337]
ys = [0.4 0.4333 0.4694 0.5085 0.5509 0.5967] %[output:0d7498c7]
%%
syms p1 p2 x
f = p1 * exp(p2*x) %[output:2cd2cb49]
Dfp1 = diff(f, p1) %[output:6f57d543]
Dfp2 = diff(f, p2) %[output:50b2d5c2]
Dfx = diff(f, x) %[output:97893e3f]
F = matlabFunction(f) %[output:400b7b24]
p0 = [1 0] %[output:637cd6b9]
tol = 1e-4;
p = p0;
%%
% linearisation
syms a1 a2
z = a1 + a2 * x %[output:6fc6035a]
z = polyfit(xs,ys,1) %[output:4286ac9f]
pz = [exp(z(2)), z(1)] %[output:6a4423df]
%%
X = linspace(0, 2, 100) %[output:3db48fac]
Y = F(p(1), p(2), X) %[output:248ad73e]
YZ = F(pz(1), pz(2), X) %[output:363b502c]
plot(X, Y) %[output:58a40621]
hold on %[output:58a40621]
plot(X, YZ) %[output:58a40621]
legend("f", "z") %[output:58a40621]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:09edc337]
%   data: {"dataType":"matrix","outputData":{"columns":6,"name":"xs","rows":1,"type":"double","value":[["0","0.4000","0.8000","1.2000","1.6000","2.0000"]]}}
%---
%[output:0d7498c7]
%   data: {"dataType":"matrix","outputData":{"columns":6,"name":"ys","rows":1,"type":"double","value":[["0.4000","0.4333","0.4694","0.5085","0.5509","0.5967"]]}}
%---
%[output:2cd2cb49]
%   data: {"dataType":"symbolic","outputData":{"name":"f","value":"p_1 \\,{\\mathrm{e}}^{p_2 \\,x}"}}
%---
%[output:6f57d543]
%   data: {"dataType":"symbolic","outputData":{"name":"Dfp1","value":"{\\mathrm{e}}^{p_2 \\,x}"}}
%---
%[output:50b2d5c2]
%   data: {"dataType":"symbolic","outputData":{"name":"Dfp2","value":"p_1 \\,x\\,{\\mathrm{e}}^{p_2 \\,x}"}}
%---
%[output:97893e3f]
%   data: {"dataType":"symbolic","outputData":{"name":"Dfx","value":"p_1 \\,p_2 \\,{\\mathrm{e}}^{p_2 \\,x}"}}
%---
%[output:400b7b24]
%   data: {"dataType":"textualVariable","outputData":{"header":"function_handle with value:","name":"F","value":"    @(p1,p2,x)p1.*exp(p2.*x)\n"}}
%---
%[output:637cd6b9]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"p0","rows":1,"type":"double","value":[["1","0"]]}}
%---
%[output:6fc6035a]
%   data: {"dataType":"symbolic","outputData":{"name":"z","value":"a_1 +a_2 \\,x"}}
%---
%[output:4286ac9f]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"z","rows":1,"type":"double","value":[["0.0982","0.3949"]]}}
%---
%[output:6a4423df]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"pz","rows":1,"type":"double","value":[["1.4842","0.0982"]]}}
%---
%[output:3db48fac]
%   data: {"dataType":"matrix","outputData":{"columns":100,"name":"X","rows":1,"type":"double","value":[["0","0.0202","0.0404","0.0606","0.0808","0.1010","0.1212","0.1414","0.1616","0.1818","0.2020","0.2222","0.2424","0.2626","0.2828","0.3030","0.3232","0.3434","0.3636","0.3838","0.4040","0.4242","0.4444","0.4646","0.4848","0.5051","0.5253","0.5455","0.5657","0.5859"]]}}
%---
%[output:248ad73e]
%   data: {"dataType":"matrix","outputData":{"columns":100,"name":"Y","rows":1,"type":"double","value":[["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"]]}}
%---
%[output:363b502c]
%   data: {"dataType":"matrix","outputData":{"columns":100,"name":"YZ","rows":1,"type":"double","value":[["1.4842","1.4872","1.4901","1.4931","1.4961","1.4990","1.5020","1.5050","1.5080","1.5110","1.5140","1.5170","1.5200","1.5230","1.5260","1.5291","1.5321","1.5352","1.5382","1.5413","1.5443","1.5474","1.5505","1.5535","1.5566","1.5597","1.5628","1.5659","1.5690","1.5722"]]}}
%---
%[output:58a40621]
%   data: {"dataType":"image","outputData":{"dataUri":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWkAAAEPCAYAAACA1jUJAAAQAElEQVR4AezdDYxU5b3H8T+sq1QoVLMJi7wutUtTYlvBW7JpBCJY7CoQgRowKdntrlCRWpHWWrA0t1bahO2O2msU7mK5mxo2gARbiFukyZaabOkFLC1tVjBRoSm9LJHFFxJxg9f\/gwd3Z3dm58zMOec5z\/k2fc6ZOa\/P83mOPw7PnBkGX3vttR9SMOAa4BrgGrDzGhgs\/A8BBBBAwFoBQtrarqFiCCDQr0DCFhLSCetwmosAAvESIKTj1V\/UFgEEEiZASCesw2muiwK0yWUBQtrl3qVtCCAQewFCOvZdSAMQQMBlAULa5d5NbttoOQLOCBDSznQlDUEAARcFCGkXe5U2IYCAMwKEtDNdmb0hrEUAgXgKENLx7DdqjQACCREgpBPS0TQTAQTiKZDckI5nf1FrBBBImIA1IV1aWiqNjY2yd+9eaWtrk507d8q0adMS1h00FwEEEOgtYE1Ib9y4UaqqquTEiRNy9OhRGTlypGzYsEFKSkp615h3CCCAQIIEeoR0tK2eNGmSHDx4UOrr62XlypWioa131wsXLoy2YpwdAQQQiFDAipAeNWqUnDt3Tvbs2XOZorOz07yeOHGimTNBAAEEkihgRUifOnVKqqurpbW11fTB2LFjZdWqVeb1rl27zJwJAgggkC6QhPdWhLQHrePPq1evlpaWFhkyZIikUinp6OjwVveZP\/XUU9Le3k7BgGuAa6Co14BmS5\/AiWiBNSE9dOhQ2bZtmyxatMgE84IFC8z7bC5TpkwxHzbqB46UKmOhXlhcsujpgEtfE\/XBpX8XzRa1saFYE9J696xj02vXrpW6ujo5c+aMDT6xq8PmzZtjV+cwKpwYF5+YuPgEi2BzK0J69OjRUlZWZh6\/GzdunNTU1FwukydPjoAlvqdsamqKb+UDrDku\/ePi0r+LTUutCOlZs2YZk\/Hjx8vy5ct7lfnz55t1TBBAAIEkClgR0s3NzWY8VcfI0sv69euT2C+0uWgCHAiBeAtYEdLxJqT2CCCAQHAChHRwthwZAQQQKFiAkC6YMHYHoMIIIBAjAUI6Rp1FVRFAIHkChHTy+pwWI9BLQL9dl4Rv7mo7ezU8Jm8IaRGJSV9RTQQCEdBv16U\/VeXie21nIIABH5SQDhiYwyOAAAKFCBDSheixLwIIIBCwQP8hHfBJOTwCCCBQbIEbbrhBysvLi33YyI9HSEfeBVQAAQQKFdixY4ds2rRJvva1rxV6KOv2J6St6xIqhAACfgVGjx4tzz77rOhPTPjd1\/btCWnbe4j6IYBAVgENZ93gzjvvlNmzZ+tLpwoh7VR30hgEkifw8ssvm0a\/9tprcvLkSfPapQkh7VJv0hYEegjk8\/Lqm5dJ2Zr\/tb5oPb32eXfSv\/vd7+TVV1\/1FjszJ6Sd6UoagkDhAuf\/uEnOrP8P64vWs\/DWxuMIhHQ8+olaIoBAQgUI6YR2fCKbTaMRiKEAIR3DTqPKCCDQV+DixYt9FzqwhJB2oBNpAgJJF9AfhHrxxRedZCCknezWXBvFdgggYLsAIW17D1E\/BBBItAAhnejup\/EIIGC7ACHdu4d4hwACCFglQEhb1R1UBgEEEOgtQEj39uAdAgggYJXAgCFtVW2pDAIIIJAwAUI6YR1OcxFwTaCmpkaef\/75XqWxsdGZZhLSznQlDUGgcIFVU4fJyXtGWl+0nl5r33jjDfn73\/9uytmzZ+W6666T4cOHe6tjPyekY9+FNACB4gmkDr0rY\/\/7\/6wvWk+v1W1tbbJu3TrRu+eJEyfKO++8I\/fff7+3OvZzQjr2XUgDEEBg8ODBsmXLFrniiiukrq5Ozp8\/7wwKIe1MV9IQBDIKOL\/iiSeekJEjR8ratWud+9dZCGnnL18aiIDbAitWrJCbbrpJXnrpJens7JTPf\/7zosMerrSakHalJ2kHAgkVuOOOO0zLb731VvnVr35livdPapkVMZ+EEtI6qD\/QP7U+YsQIefDBB2XPnj3S2tpqPggoLy+POS\/Vt1WAerkjUF1dLfpTpT3LzJkznWlgoCE9ZswYM4g\/Z84cKSsry4r26KOPyje+8Q05ffq0\/Pvf\/5bbbrtNUqlU1n1YiQACCLguEGhIb9++Xerr60U\/ec0GWVpaKlOnTpWjR49KbW2t1NTUyMGDB2XChAlyzTXXZNuVdQgggIDTAoGGtAaulq6urqyIH3zwgbz\/\/vsyduxYGTZsmOjQR0VFhVy4cEH04fSsO7OyOAIcJbEChw8flvb2dueLtjOXTtYvygx\/pSWXTUPZJtCQ7ujoEC3d3d0DNuaZZ54x4ayf0OqYtA6PPPfccwPuxwYIIFCYwH333ddnTLfn+K4rr7Wd\/UlVjbpSNJi33XGN+aZlf9tEuSzQkM61YSUlJfKtb33LbK5f8Tx+\/Lh8+OGHsnjx4gGHSvQOQIdUzM5MEEAAgRwENJS16FfgV00davZIHXpP\/vPDuXLXf70kb9+42CyzYWJFSM+YMcPcRes\/JLlkyRJZunSp\/PrXv5ZPfepTop\/cZoPSP+WbmpqybZLnOnZDAAFXBDLdLetX4O\/afVZSh96V9lMXRLNEM8WmdlsR0tdff70x0aER8+KjyaFDhz6aikyaNMnMmSCAAAJ+BPROWUv63bIGs4ayFj\/Hi2rbyEJ63rx5snXrVtEPCPfv32\/ar0MeX\/\/612XKlCny0EMPmWX79u0zcyYIIIBANgENZC0aylq8bTWUe94te8vjMvcT0kVtU2VlpXnETr+wonfQ+k0h\/XEU\/eLLU089Jdddd53s2LFDjhw5UtTzcjAEEHBDINsQhgaz3ilriXtrQwnpuXPn9hlbbmhoMJ8o6wd\/irhp0yaZPXu2eU76xz\/+sdx+++3yi1\/8QldREEAAASOgd8pa9E655wd+LoWyaWiPSSgh3eN8A77Uu+q9e\/fKW2+9NeC2bIAAAm4LaCBrSX88TkM5pyEMB3isC2kHTGkCAgjkKZBpCCN16D3RYE4detc8iZHn4WO5GyEdy26j0gi4I6B3ylqyDWHo43HutNhfSwhpf15sjUDMBaKvfqa7Zb1TTsoQhp9eIKT9aLEtAgj4FkgP5aR84OcbKsMOhHQGGBYjgED+Ajp8oaW\/IQzulv25EtL+vNjaPQFaVAQBDWQtSX4KowiM\/R6CkO6XhYUIIJBNIH0Iw9s2leCnMDyDYs8J6WKLcjwEHBXQO2Ut\/Q1hpD5+NC7JT2EE1e2EdFCyMT4uVUdABTSQtWgoa9FlWngKQxXCK4R0eNacCQGrBTINYWgoa\/Hulq1uhIOVI6Qd7FSahEAuAumhzKNxuaiFvw0hnYs52yDgiIAOX2jR4Yv0UObRODs7mZC2s1+oFQJFEdBA1qKhrMU7qA5fEMqeht1zQtru\/qF2CPgSSB\/C8HbWUNbCuLInEp95niEdnwZSUwRcFkgP5fQhDEI5\/r1PSMe\/D2lBggS8UPaGMNJDmSEM9y4GQtq9PqVFjgloIGvRMWUvlLWJOnxBKKtEbiWuWxHSce056u2sgAayFg1lLV5De4ayDmN4y5m7LUBIu92\/tC4GAhrIWvr7cSINZg1kLTFoClUMQICQDgCVQyKQTcAbV04P5VTYP06UrZKss0aAkLamK6iIqwJeKOvdsg5feOPK6aHMjxO5egUU1i5CujA\/9kagj0CmUNYNdfiCD\/tUgpKrACGdqxTbJUAg\/ybqXbKWnnfKerSeoZw69K4uoiDgS4CQ9sXFxghcEtBA1qKhrOXSUhFC2ZNgXiwBQrpYkhzHaQENZC0ayFq8xmooa9G7ZC3ecuYIFEuAkC6WpJvHSWyrNJC1pD+BoYGsRQNZS2KBaHhoAoR0aNScyGYBDWQt6aGc4rE4m7stEXUjpBPRzTQyXcB7AmOgUOaxuHQ53octQEj7FGfzeAqkhzLPKsezH5NYa0I6ib2egDYPFMo8q5yAi8CRJhLSjnRk0ptBKCf9CnC3\/YWHtLs2tMxiAS+U9cM+fSQuffiCO2WLO4+q+RIIJaTXrVsnzc3NA1Zs6dKlsmPHDmlra5Pf\/va3Mn369AH3YYNkCGQKZW29PhJHKKsExUWBQEN6zJgxUldXJ3PmzJGysrKsfrNnz5Z7771Xuru75U9\/+pOMGDFCfvKTn2Tdh5XuCuQayim+au3uRRBcy2J15EBDevv27VJfXy+DBw98mocfflg6Oztl8eLFoq\/XrFkjgwYNki996UuxAqWy+QkQyvm5sZf7AgOnZwEGtbW1oqWrqyvrUYYMGSJDhw6V3bt3yy233CI1NTXyt7\/9TWbMmCFHjhzJui8r4ylAKMez36h1+AKBhnRHR4do0SGMbE37whe+YFbrXfRjjz0my5cvl9bWVnn66afNcibxFyCU7e5DamevQKAhnWuzr7\/+erOpDos88MADcvfdd8vx48fly1\/+stx5551mXaZJe3u7GVLJtJ7l0Qh4oex9o897+kJr0\/ODPsaUVYRii4AOz2qm2FIfrYcVIe0Nh7z88sty4MABef311+VHP\/qR1k+mTp1q5pkmVVVV0tTUlGk1y0MSyBTKqY9\/+8J7+iLFB30h9QinyUdAs0QzJZ99g9rHipB+9dVXTfuuvvpqM9fJZz7zGZ3JuXPnzJyJXQK5hnJsf\/vCLm5qk2CByEJ63rx5snXrVqmoqJA333xTTp8+LTfddJN5ZG\/atGny6KOPmm554YUXzJxJtAKEcrT+nD25ApGFdGVlpUyYMEHKy8uN\/kMPPSTvv\/++GV9+\/PHHzXPVGzdulGPHjpn1TMIV0G\/yaUkfU06lDV9wpxxuv3C25AmEEtJz586V6urqXroNDQ2iYz\/eIL0OeeiXXpYtWybf\/\/73Rb\/csmXLll778CY4AQ1kLV4oe2f6JJTPSuqj8WRC2ZNhjkA4AqGEdK5NuXjxonk+Wj9APH\/+fK67sV0eAhrIWjKFsgayFkI5D1x2QaCIAlaFdBHbxaHSBDSQteiPEWnxVqc+Hr5IfXSXrIVQ9mSYI2CHACGdfz9YvacGshYNZC1eZfUZZS0ayFoIZU+GOQJ2ChDSdvaLr1p5T17kEsq+DszGCCAQuQAhHXkX+K9Aeiinf5uv552y\/6OzBwII2CRQ1JC2qWEu1cULZe9DvvRQ5tt8LvU2bUGgtwAh3dvDinc6bKElPZRTH3\/IRyhb0U1UAoFQBAjpUJizn0QDWYsXyt7W6aHMh3yeDHMEiiVg\/3EI6ZD7yBu60FDWpy60eFXwQjnF43AeCXMEEi9ASAd8CaSHcvp4cs8P+bhTDrgzODwCMRQgpIvcaV4oe0MX6aHMeHKRwTlcsQU4nmUChHSBHaLDFlrSQznFh3wFyrI7AgioACGtCj6KBrIWL5S9XdNDmaELT4Y5AggUIkBIZ9Hzhi40lPUDPi3e5l4op\/iQzyNxdk7DEIhSgJDuoe+FsneXnD6ezId8PbB4iQACoQgkOqT1DllLeiinGE8O5eLjJAggMLBAYkLau0vWUNZhCy0eT3ooM57syWSYWHbacAAADbFJREFUsxgBBEITcDak00OZoYvQrilOhAACRRRwJqT1DllL+tCFWulYMs8nqwQFAQTiJhDrkB7+SovosIUWDz596CJ16F1vVYBzDo0AAggEIxDrkFYSvUvWomGshfFkVaEggIArArEO6bdvXOxKP9AOBBBAoF+BoEK635OxEAEEEEDAnwAh7c+LrRFAAIFQBQjpULk5GQIIWCtgacUIaUs7hmohgAACKkBIqwIFAQQQsFSAkLa0Y6gWAtELUAMbBAhpG3qBOiCAAAIZBAjpDDAsRgABBGwQIKRt6AXqEBcB6olA6AKEdOjknBABBBDIXYCQzt2KLRFAAIHQBQjp0MndOiGtQQCBYAVCCel169ZJc3Nzzi2pqamR\/fv3yw033JDzPmyIAAIIuCgQaEiPGTNG6urqZM6cOVJWVpaT32c\/+1lZtmyZlJaWmpLTTmyEAAIIOCoQaEhv375d6uvrZfDg3E5TUlIiv\/zlL6W7uzu+3NQcAQQQKKJAbumZ5wlra2tFS1dXV05HWL9+vYwYMUKeffbZnLZnIwQQQMB1gUBDuqOjQ7Tkcmc8e\/ZsmT59ujQ2NsqZM2dydm9vbzd36znvwIYIIIBABgH9m79mSobVkSwONKQvtWjg6bXXXiuPPPKI\/PWvf5Xnn39+4B16bFFVVSVNTU09lvASAQQQyE9As0QzJb+9g9nLipB+4IEH5KqrrpLhw4fLli1bzAeH8tH\/1qxZIytWrPjoFf9HAAEEkilgRUj\/4x\/\/kDfeeMP0gIa1foCob\/QDxyuuuEJfUhBAAIHQBGw6UWQhPW\/ePNm6datUVFRIS0uLLFmy5HJ54oknjNFPf\/pTefLJJ81rJggggEASBSIL6crKSpkwYYKUl5f3cb948WKfZSxAAAEEkigQSkjPnTtXqqure\/k2NDSIDtD390nqvn37zLrDhw\/32oc3CCAQkQCnjUwglJCOrHWcGAEEEIi5ACEd8w6k+ggg4LYAIe12\/9K6wAQ4MALhCBDS4ThzFgQQQCAvAUI6LzZ2QgABBMIRIKTDcU7CWWgjAggEIEBIB4DKIRFAAIFiCRDSxZLkOAgggEAAAoR0AKjeIZkjgAAChQoQ0oUKsj8CCCAQoAAhHSAuh0YAAQQKFQg3pAutLfsjgAACCRMgpBPW4TQXAQTiJUBIx6u\/qC0CCIQrEPnZCOnIu4AKIIAAApkFCOnMNqxBAAEEIhcgpCPvAiqAQLwEqG24AoR0uN6cDQEEEPAlQEj74mJjBBBAIFwBQjpcb87mogBtQiBAAUI6QFwOjQACCBQqQEgXKsj+CCCAQIAChHSAuMk9NC1HAIFiCRDSxZLkOAgggEAAAoR0AKgcEgEEECiWACFdLMnsx2EtAgggkJcAIZ0XGzshgAAC4QgQ0uE4cxYEEEAgL4HIQjqv2rITAgggkDABQjphHU5zEUAgXgKEdLz6i9oigEBkAtGcmJCOxp2zIoAAAjkJENI5MbERAgggEI1AKCG9bt06aW5uztrC0tJSaWxslL1790pbW5vs3LlTpk2blnUfViKAQKQCnDwEgUBDesyYMVJXVydz5syRsrKyrM3ZuHGjVFVVyYkTJ+To0aMycuRI2bBhg5SUlGTdj5UIIICAywKBhvT27dulvr5eBg8e+DSTJk2SgwcPmu1XrlwpGtp6d71w4UKX\/WkbAgggkFVg4PTMunv2lbW1taKlq6sr64ajRo2Sc+fOyZ49ey5v19nZaV5PnDjRzJkgEAcB6ohAsQUCDemOjg7R0t3dnbXep06dkurqamltbTXbjR07VlatWmVe79q1y8wzTdrb283dd6b1LEcAAQRyFdC\/+Wum5Lp9GNsFGtJ+G6Djz6tXr5aWlhYZMmSIpFIpE\/LZjqPj2E1NTdk2YR0CCCCQk4BmiWZKThuHtJE1IT106FDZtm2bLFq0yATzggULzPuQHDhNUAIcFwEEChKwJqT17lnHpteuXWueCDlz5kxBDWNnBBBAwAWByEJ63rx5snXrVqmoqJDRo0ebR\/T08btx48ZJTU3N5TJ58mQXnGkDAgggkJdAZCFdWVkpEyZMkPLycpk1a5ap\/Pjx42X58uW9yvz58806dya0BAEEEMhdIJSQnjt3rnl6o2e1GhoazJdX9JNU\/TaiDtb3V9avX99zN14jgAACiRIIJaQTJUpjEUAAgSIK2BDSRWwOh0IAAQTcEiCk3epPWoMAAo4JENKOdSjNQQCBEARCPAUhHSI2p0IAAQT8ChDSfsXYHgEEEAhRgJAOEZtTIeCuAC0LSoCQDkqW4yKAAAJFECCki4DIIRBAAIGgBAjpoGQ5btIFaD8CRREgpIvCyEEQQACBYAQI6WBcOSoCCCBQFAFCuiiMHCQXAbZBAAH\/AoS0fzP2QAABBEITIKRDo+ZECCCAgH8BQtq\/WfH24EgIIIDAAAKE9ABArEYAAQSiFCCko9Tn3AgggMAAApaF9AC1ZTUCCCCQMAFCOmEdTnMRQCBeAoR0vPqL2iKAgGUCQVeHkA5amOMjgAACBQgQ0gXgsSsCCCAQtAAhHbQwx0cgaQK0t6gChHRROTkYAgggUFwBQrq4nhwNAQQQKKoAIV1UTg6GQH8CLEMgfwFCOn879kQAAQQCFyCkAyfmBAgggED+AoR0\/nbsmb8AeyKAQI4ChHSOUGyGAAIIRCFASEehzjkRQACBHAUI6Ryhgt6M4yOAAAL9CVgX0sOHD5ff\/\/73cvPNN\/dXX5YhgAACiRKwJqSvvPJKmTlzpjzzzDNy9dVXy4gRIxLVETQWAQQQ6E\/AmpD++c9\/Lj\/72c+koqLiUj2Z5iVQX1+f136u74RL\/z2MS\/8uNi21JqTXr18vtbW1snHjRpt8YleXurq62NU5jArj0r8yLv272LTUmpA+c+aMdHR0yD\/\/+c+cfbYeGyz3\/88BSg8DTPq\/HnDBxU9W6PWScxB9smEgr6wJ6Xxa19S0WSgYcA1wDQRxDeSTSUHsE+uQPv\/HTULBgGuAayCIayCIwM3nmLEO6XwazD4IIBCeAGcqXICQLtyQIyCAAAKBCRDSgdFyYAQQQKBwAetCet++fVJVVSW7d+8uvHUcAQHbBKgPAj4FrAtpn\/VncwQQQMBpAULa6e6lcQggEHcBQjruPRj7+tMABBDIJhDLkH744Ydlz5490traKg0NDVJaWpqtjc6t89P+H\/7wh\/LCCy\/0Ko899phzJgM1KOm\/rphr+5N+vWiWNDY2yt69e6WtrU127twp06ZNG+jyCnR97EL6e9\/7nsyfP186Ozvl+PHj8tWvflU2b94cKJJNB\/fbfv0Q9tOf\/rScP3\/+cnnvvfdsalKgdUn6ryv6bX\/Srxf97SA1OHHihBw9elRGjhwpGzZskJKSkkCv02wHj1VI6wW3YMECOXbsmNTU1Mh3vvMd2b9\/v3zuc59z6dfzMvZXPu3XO6gXX3xRlixZcrnoj1llPIljK5L+64p+25\/062XSpEly8OBB0V8HXLlypfnBN727XrhwYWT\/ZcQqpBVw0KBB8pvf\/OYy2J\/\/\/Gfz+pZbbjFzlyd+268X11VXXSUXL16U7373u7JixYpE\/GHW8xrQP5CS\/OuKftqf9Otl1KhRcu7cOTOU6l1D+jd2fT1x4kSdRVJiFdJf\/OIXDdJrr71m5jrRv5LoXP9aonOXi9\/2V1ZWGo5FixbJXXfdJd\/85jflueeek6VLl5rlSZjk8+uKLrn4aX\/Sr5dTp05JdXW1+axLr4GxY8fKqlWr9KXs2rXLzKOYxCKkPZiysjLz8sKFC2auk9OnT+tMei4zCxyc+G3\/sGHD5K233pJUKmXG7r\/97W\/LBx98IDrXuyYHiWhSAQJcL5fwdPx59erV0tLSIkOGDDH\/\/ejPKF9aG\/40ViHtBbL3J75yeXfQf\/nLX\/St08Vv+w8cOCC33367bNu2zbgcOXJE\/vCHP8igQYNkypQpZhkTBDwBrheRoUOHmv9e9G+fGsz6GZj334\/nFPY8ViH9yiuvGB\/vr\/36ZubMmToTb2zavHF04rf9+sFqc3Oz6B2SR6JPeujrf\/3rXzqjIHBZgOtFzN2zjk2vXbtW9F+t0eGiy0C+XhRv41iFtP7J1tXVJbfddpvoB4X6\/KI+tXD27Fl5++23i6di6ZFyaX9TU5M88sgjpgX6gaE++fLkk0+KXnj64eFXvvIVUa+TJ0+abZgkW4Dr5ZP+Hz16tOiQoj5+N27cOPMEmT5FpmXy5MmfbBjyq1iFtNroEwrd3d2iX8h4\/PHHdZHce++9Zp6EyUDt16GgG2+80VA8\/fTTosNA+lSIPpS\/ePFi86z0gw8+aNYzQYDr5ZNrYNasWebN+PHjZfny5b2KfjfDrIxgEruQfv3112XGjBly3333yT333GNev\/nmmxHQRXPKgdo\/ffp08Z7p1Dtp\/QNMh4R+8IMfyN133y233nqr6B15NLWP7qxJ\/3XFTO0P8XqJrvNzPLMODeoXWfor+ihjjocp+maxC2lP4PDhw+YbQd77pM39tF+f6NAv\/WjAJ82J9voX4HrxbxbkHrEN6SBRODYCCCBgiwAhbUtPUI\/ECdBgBHIRIKRzUWIbBBBAICIBQjoieE6LAAII5CJASOeixDbhCHAWBBDoI0BI9yFhAQIIIGCPACFtT19QEwQQQKCPACHdh8SmBdQFAQSSLkBIJ\/0KoP0IIGC1wP8DAAD\/\/yr5BVsAAAAGSURBVAMAv6\/qJlfLsWQAAAAASUVORK5CYII=","height":271,"width":361}}
%---
