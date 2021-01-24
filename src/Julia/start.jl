#!/usr/bin/env julia

import Pkg: activate, status

if pwd() == homedir() * "/Git_Projects/Web/Algebra-linear-II"
    activate(pwd() * "/src/Julia")
elseif pwd() == homedir() * "/Git_Projects/Web/Algebra-linear-II/src/Julia"
    activate("")
end

#https://discourse.julialang.org/t/how-to-get-a-function-to-print-stuff-with-repl-like-formatting/45877
function printout(x)
    show(stdout, "text/plain", x)
    println()
end

include("version.jl")
include("docs.jl")
include("galois.jl")
include("latex.jl")
include("plots.jl")
