using DN3
using Plots
using Statistics

# Definicija sistema diferencialnih enačb
function vanderpol(t, u)
    du1 = u[2]
    du2 = 4 * (1 - u[1]^2) * u[2] - u[1]
    return [du1, du2]
end

# Začetni pogoji
u0 = [2.0, 0.0]
t0 = 0.0

# Časovni interval za integracijo
tspan = (0.0, 1000.0)
h = 0.01  # časovni korak

# Reševanje sistema z metodo Runge-Kutta 4. reda
problem = ZacetniProblemNDE(vanderpol, t0, u0)
t_sol, us = runge_kutta_4(problem, tspan, h)

# Funkcija za iskanje prehodov skozi ničlo in določitev periodičnosti
function find_period(t, y)
    crossings = []
    for i in 2:length(y)-1
        if y[i-1] < 0 && y[i] > 0
            push!(crossings, t[i])
        end
    end
    periods = diff(crossings)
    return periods
end

# Analiza rezultatov
y1_sol = us[1, :]
periods = find_period(t_sol, y1_sol)

# Povprečna perioda
average_period = mean(periods)

println("Perioda limitnega cikla: $(round(average_period, digits=10))")

# Grafični prikaz rešitve
plot(t_sol, us[1, :], title="Rešitev diferencialne enačbe", xlabel="t", ylabel="x(t)")
plot(us[1, :], us[2, :], title="Fazni prostor", xlabel="x", ylabel="x'")