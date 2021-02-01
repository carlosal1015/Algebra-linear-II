#!/usr/bin/env julia

using LinearAlgebra, AsyPlots
Plot(map(Point, eigvals(randn(1000, 1000))))

r(u) = 2 - cos(u);
x(u, v) = 3 * cos(u) * (1 + sin(u)) + r(u) * cos(v) * (u < pi ? cos(u) : -1)
y(u, v) = 8 * sin(u) + (u < pi ? r(u) * sin(u) * cos(v) : 0)
z(u, v) = r(u) * sin(v)
U = range(0, 2π, length = 60)
V = range(0, 2π, length = 30)
sp = Pen(opacity = 0.9)
c = ["LightBlue", "MidnightBlue", "LightBlue"]
mp = Pen(color = 0.2 * NamedColor(1, 1, 1), linewidth = 0.3)
Plot(
    Surface(
        [x(u, v) for u in U, v in V],
        [y(u, v) for u in U, v in V],
        [z(u, v) for u in U, v in V],
        surfacepen = sp,
        meshpen = mp,
        colors = c,
    ),
    axes = false,
    camera = (10, -15, 8),
)            axes=false,camera=(10,-15,8))
