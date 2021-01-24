#!/usr/bin/env julia


# Type definition: Galois fields GF(p), where p is prime modulus, T is integer type
#https://stackoverflow.com/a/46863550/9302545
struct GF{p,T} <: Number where {p,T<:Integer}
    rep::T  # representative integer which holds the value of a GF(p) variable
    function GF{p,T}(x::Integer) where {p,T<:Integer}
        return new(mod(x, p))
    end
end

GF{p}(x::T) where {p,T<:Integer} = GF{p,T}(x)


import Base: convert, inv, one, promote_rule, show, zero, abs, conj, isless
#https://github.com/JuliaData/DataFrames.jl/issues/1139#issue-198117727
import Primes: isprime

#https://stackoverflow.com/a/58253283/9302545
function call(::Type{GF{p}}, x::Integer) where {p}
    if !isprime(p)
        throw(ArgumentError("p must be prime"))
    end
    return GF{p,typeof(x)}(mod(x, p))
end

convert(::Type{GF{p,T}}, x::Integer) where {p,T} = GF{p}(x)
convert(::Type{GF{p}}, x::Integer) where {p} = GF{p}(x)
convert(::Type{GF{p,T}}, x::GF{p}) where {p,T} = GF{p,T}(x.rep)
promote_rule(::Type{GF{p,T1}}, ::Type{T2}) where {p,T1,T2<:Integer} =
    GF{p,promote_type(T1, T2)}
show(io::IO, x::GF) = show(io, x.rep);

subtypes(Number)

GF{2}(11)
# Create some GF(7) variables and do arithmetic

x = GF{7}(9)   # x =  9 mod 7 = 2
y = GF{7}(12)  # y = 12 mod 7 = 5


# Define arithmetic operations on GF(p)
import Base: +, -, *, /

for op in (:+, :-, :*)   # loop over ops, defining each in terms of integer ops mod p
    @eval begin
        ($op)(x::GF{p,T}, y::GF{p,T}) where {p,T} = GF{p,T}($(op)(x.rep, y.rep))
    end
end

x, y = GF{5}(4), GF{5}(3)
@show x + y
@show x - y
@show x * y

# Define inverse and ÷. Requires more care than +, -, * because dividing by zero throws error
function inv(x::GF{p,T}) where {p,T}
    if x == zero(x)
        throw(DivideError())
    end
    r, u, v = gcdx(x.rep, p)
    GF{p,T}(u)
end
(/)(x::GF{p,T}, y::GF{p,T}) where {p,T} = x * inv(y);

abs(x::GF{p,T}) where {p,T} = GF{p,T}(abs(x.rep))
conj(x::GF{p,T}) where {p,T} = GF{p,T}(conj(x.rep))

@show x / y
@show x \ y # we get this by inheritance from number;

(isless)(x::GF{p,T}, y::GF{p,T}) where {p,T} = isless(x.rep, y.rep)

@show x
@show y
@show x + y     # 2 + 5 mod 7 = 0
@show x - y     # 2 - 5 mod 7 = 4
@show x * y     # 2 * 5 mod 7 = 3
@show x / y;

#https://stackoverflow.com/a/25006629/9302545
import Random
Random.seed!(1234); #srand(1234)
A = [GF{7}(rand(0:6)) for i = 1:4, j = 1:4]; # matrix of random GF(7) elems
A[1, 1] = 3;
A[1, 2] = 5;
A[1, 3] = 3;
A[1, 4] = 3;
A[2, 1] = 6;
A[2, 2] = 6;
A[2, 3] = 2;
A[2, 4] = 0;
A[3, 1] = 2;
A[3, 2] = 2;
A[3, 3] = 6;
A[3, 4] = 4;
A[4, 1] = 2;
A[4, 2] = 6;
A[4, 3] = 1;
A[4, 4] = 2;

A#[3 5 3 3; 6 6 2 0; 2 2 6 4; 2 6 1 2]
b = [GF{7}(rand(0:6)) for i = 1:4];# random vector b for Ax=b problem
b[1] = 1;
b[2] = 4;
b[3] = 3;
b[4] = 0;
b

x = A \ b   # solve Ax=b over GF(p)!

A * x - b   # check that x satisfies Ax=b

#@show typeof(b)
