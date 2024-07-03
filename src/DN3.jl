module DN3

using DifferentialEquations
using Plots
using Statistics

export ZacetniProblemNDE, runge_kutta_4

# Definicija strukture za začetni problem diferencialne enačbe
struct ZacetniProblemNDE
    f  # Funkcija, ki opisuje sistem diferencialnih enačb
    x0  # Začetna vrednost neodvisne spremenljivke (čas)
    y0  # Začetni pogoji (vektor začetnih vrednosti odvisnih spremenljivk)
end

"""
Funkcija runge_kutta_4 numerično reši sistem navadnih diferencialnih enačb z metodo Runge-Kutta 4. reda. 
Sprejme začetni problem problem, časovni interval tspan, in korak h. 
Izračuna časovne točke ts in inicializira matriko us za shranjevanje rešitev.
Skozi časovne točke iterativno izračuna približke naklona (k1, k2, k3, k4) in posodobi 
vrednosti odvisnih spremenljivk. Na koncu vrne časovne točke ts in rešitve us.
"""

# Runge-Kutta 4. reda
function runge_kutta_4(problem::ZacetniProblemNDE, tspan, h)
    t0, tf = tspan
    ts = t0:h:tf
    us = zeros(length(problem.y0), length(ts))
    us[:, 1] = problem.y0
    
    for i in 1:(length(ts)-1)
        t = ts[i]
        u = us[:, i]
        
        k1 = h * problem.f(t, u)
        k2 = h * problem.f(t + 0.5 * h, u + 0.5 * k1)
        k3 = h * problem.f(t + 0.5 * h, u + 0.5 * k2)
        k4 = h * problem.f(t + h, u + k3)
        
        us[:, i+1] = u + (k1 + 2 * k2 + 2 * k3 + k4) / 6
    end
    
    return ts, us
end




end # module DN3
