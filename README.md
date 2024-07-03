# Perioda limitnega cikla

V tej domači nalogi sem moral poiskati periodo limitnega cikla za diferencialno enačbo: $x''(t) - 4(1-x^2)x'(t) + x = 0$

Na začetku sem definiral podatkovni tip ZacetniProblemNDE, ki predstavlja začetni problem navadne diferencialne enačbe. Potem sem definiral funkcijo, ki reši dano diferencialno enačbo z uporabo Runge-Kutta metode 4. reda, ki uporablja definirano podatkovno strukturo. Torej funkcija runge_kutta_4 poišče približek za rešitev diferencialne enačbe y'(x)=f(x, y(x)) z začetnim pogojem y(x0) = y0 na intervalu [x0, xk] z korakom h. S preizkušanjem različnih točk in risanjem grafa sem poiskal začetni približek, in sicer x0 = 2 in y0 = 0.

Potem sem dobljeni rezultat uporabil za iskanje periode funkcije. Funckija "find_period(t, y)" je uporabljena za iskanje prehodov skozi ničlo rešitve y in izračun obdobij med temi prehodi. Da bi dobili občutek danega limitnega cikla, na sliki lahko vidimo graf v fazni ravnini:

