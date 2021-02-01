#!/usr/bin/env julia

using LinearMaps, LinearAlgebra

A = LinearMap(rand(10, 10))
Matrix(A)
B = LinearMap(cumsum, reverse ∘ cumsum ∘ reverse, 10)
Matrix(B)

3.0A + 2B
Matrix(3.0A + 2B)
A + I
Matrix(A + I)
A * B'
Matrix(A * B')
[A B; B A]
Matrix([A B; B A])
kron(A, B)
Matrix(kron(A, B))

CS = LinearMap{Int}(cumsum, 3)::LinearMaps.FunctionMap
Matrix(CS)
LinearMap(ones(Int, 3, 3)) + CS + I + rand(3, 3)
Matrix(LinearMap(ones(Int, 3, 3)) + CS + I + rand(3, 3))
LinearMap(ones(Int, 3, 3)) * CS * I * rand(3, 3)
Matrix(LinearMap(ones(Int, 3, 3)) * CS * I * rand(3, 3))

J = LinearMap(I, 2) # 2×2 identity map
Matrix(J)
using SparseArrays
#https://docs.julialang.org/en/v1/stdlib/SparseArrays/#stdlib-sparse-arrays
#spdiagm(-1 => [1, 2, 3, 4], 1 => [4, 3, 2, 1])

E = spdiagm(-1 => trues(1))
Matrix(E)
D = E + E' - 2I
Matrix(D)
Δ = kron(D, J) + kron(J, D) # discrete 2D-Laplace operator
Matrix(Δ)

J = LinearMap(I, 2) # 2×2 identity map
Matrix(J)
E = spdiagm(-1 => trues(1))
Matrix(E)
D = LinearMap(E + E' - 2I)
Matrix(D)
Δ₁ = kron(D, J) + kron(J, D); # discrete 2D-Laplace operator, Kronecker sum
Matrix(Δ₁)
Δ₂ = kronsum(D, D)
Matrix(Δ₂)
Δ₃ = D^⊕(2)
Matrix(Δ₃)
Matrix(Δ₁) == Matrix(Δ₂) == Matrix(Δ₃)

CS = LinearMap{Int}(cumsum, 3)::LinearMaps.FunctionMap
Matrix(CS)

L = [CS LinearMap(ones(Int, 3, 3))]::LinearMaps.BlockMap
Matrix(L)
L * ones(Int, 6)

CS = LinearMap{Int}(cumsum, 3)::LinearMaps.FunctionMap
Matrix(CS)
L = [CS; LinearMap(ones(Int, 3, 3))]::LinearMaps.BlockMap
Matrix(L)
L * ones(Int, 3)

CS = LinearMap{Int}(cumsum, 3)::LinearMaps.FunctionMap
Matrix(CS)
L = [CS CS; CS CS]::LinearMaps.BlockMap
Matrix(L)
L.rows
L * ones(Int, 6)

A = LinearMap([1.0 2.0; 3.0 4.0])
x = [1.0, 1.0]
A * x
A(x)

A = LinearMap([1.0 2.0; 3.0 4.0])
X = [1.0 1.0; 1.0 1.0]

A * X isa LinearMaps.CompositeMap

X = [1.0 1.0; 1.0 1.0]
A = LinearMap([1.0 2.0; 3.0 4.0])

X * A isa LinearMaps.CompositeMap

A = LinearMap([1.0 2.0; 3.0 4.0])
B = [1.0, 1.0]
Y = similar(B)
mul!(Y, A, B)

A = LinearMap([1.0 2.0; 3.0 4.0])
B = [1.0 1.0; 1.0 1.0]
Y = similar(B)
mul!(Y, A, B)
Y

A = LinearMap([1.0 2.0; 3.0 4.0])
B = [1.0, 1.0]
C = [1.0, 3.0]

mul!(C, A, B, 100.0, 10.0) === C
C

A = LinearMap([1.0 2.0; 3.0 4.0])
B = [1.0 1.0; 1.0 1.0]
C = [1.0 2.0; 3.0 4.0]

mul!(C, A, B, 100.0, 10.0) === C

C

A = [1.0 1.0; 1.0 1.0]
B = LinearMap([1.0 2.0; 3.0 4.0])
C = similar(A)
mul!(C, A, B)
C

A = LinearMap([1.0 2.0; 3.0 4.0])
x = [1.0, 1.0]
x'A

A = LinearMap([1.0 2.0; 3.0 4.0])
x = [1.0, 1.0]
transpose(x) * A
