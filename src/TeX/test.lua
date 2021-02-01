#!/usr/bin/env luahbtex

--luajit

ffi = require("ffi")
JULIA = ffi.load("julia", true) -- /usr/lib/julia/sys.so

ffi.cdef [[
  void jl_init_with_image__threading(const char *julia_bindir,
                                   const char *image_relative_path);

  typedef struct _jl_value_t jl_value_t;
  jl_value_t *jl_eval_string(const char*);
  char *jl_string_ptr(jl_value_t *);
]]

JULIA.jl_init_with_image__threading("../Julia/", "IntroLinearAlgebra.so")
-- JULIA.jl_init_with_image__threading("/usr/lib/julia/", "sys.so")
julia = julia or {}

function julia.eval(str, flag)
    local jval = JULIA.jl_eval_string(str)
    if flag then
        local lval = ffi.string(JULIA.jl_string_ptr(jval))
        tex.sprint(lval)
    end
end

code = [[
function printout(x)
  show(stdout, "text/plain", x)
  println()
end

printout(Array{0})
print("A")
#printout(@time using Plots)
]]

JULIA.jl_eval_string(code)
