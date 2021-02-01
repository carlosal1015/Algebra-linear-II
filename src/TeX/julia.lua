local ffi = require("ffi")
local JULIA = ffi.load("julia", true)

ffi.cdef [[
// Types
typedef struct _jl_value_t jl_value_t;

// Initialization
void jl_init__threading(void);
void jl_init_with_image__threading(const char *julia_bindir,
                                   const char *image_relative_path);

// Execution and conversion
jl_value_t *jl_eval_string(const char*);
const char *jl_string_ptr(jl_value_t *);
const char *jl_typeof_str(jl_value_t *);
]]

local julia_initialized = false

local julia = {}

function julia.init(rpath)
    -- Initialize the Julia interpreter (singleton)
    if not julia_initialized then
        if rpath then
            JULIA.jl_init_with_image__threading(rpath, "sys.so")
        else
            JULIA.jl_init__threading()
        end
        julia_initialized = true
    end
end

function julia.run(expr)
    assert(julia_initialized)
    JULIA.jl_eval_string(expr)
end

function julia.eval(expr)
    assert(julia_initialized)
    local jlval, cstr, str
    jlval = JULIA.jl_eval_string(expr)
    -- First check that the datatype
    if jlval ~= ffi.NULL then
        cstr = JULIA.jl_typeof_str(jlval)
    else
        return nil
    end
    if cstr ~= ffi.NULL then
        str = ffi.string(cstr)
    else
        return nil
    end
    -- if the datatype is string, convert to Lua string
    if str == "String" then
        cstr = JULIA.jl_string_ptr(jlval)
    else
        return nil
    end
    if cstr ~= ffi.NULL then
        str = ffi.string(cstr)
    else
        return nil
    end
    return str
end

return julia
