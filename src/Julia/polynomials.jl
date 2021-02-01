#!/usr/bin/env julia

using Polynomials, Latexify

p = Polynomial([1, 2, 3, 4], :z)
q = fromroots([1, 2, 3, 4])
round.(roots(q))

p1 = Polynomial([2, -1, 2, -1], :z)
round.(roots(p1))

latexify(round.(roots(p1)))

#show(::IO, x^2-3x+4y^4*x)
#p(λ) = -λ³ + 2λ² - λ + 2

using Plots

xs = range(0, 10, length = 10);
ys = @. exp(-xs);
f = fit(xs, ys); # degree = length(xs) - 1
f2 = fit(xs, ys, 2); # degree = 2

scatter(xs, ys, markerstrokewidth = 0, label = "Data")
plot!(f, extrema(xs)..., label = "Fit")
plot!(f2, extrema(xs)..., label = "Quadratic Fit")
