#!/usr/bin/env julia

using Plots
gr(fmt = :png)
plot(sin, -2π, 2π, label = "sin(x)")

n = 100
ϵ = randn(n)
plot(1:n, ϵ)

ϵ = zeros(n);

for i in eachindex(ϵ)
    ϵ[i] = randn(n)[i]
end