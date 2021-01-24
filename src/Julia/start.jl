#!/usr/bin/env julia

import Pkg: activate, status;

const LOCAL_PATH = homedir() * "/Git_Projects/Web/Algebra-linear-II";
const GHA_PATH = homedir() * "/work/Algebra-linear-II/Algebra-linear-II";

if pwd() == LOCAL_PATH
    activate(LOCAL_PATH * "/src/Julia")
elseif pwd() == LOCAL_PATH * "/src/Julia"
    activate("")
elseif pwd() == GHA_PATH
    activate(GHA_PATH * "/src/Julia")
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
