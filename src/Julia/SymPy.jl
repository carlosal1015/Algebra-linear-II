#!/usr/bin/env julia

#https://docs.sympy.org/latest/modules/matrices/matrices.html
#https://juliahub.com/docs/SymPy/KzewI/1.0.38/
using SymPy, Latexify

@vars x

@vars a real = true

sin(x)
log(x)

limit(sin(a * x) / x, x => 0)

latexify(string(diff(x^x, (x, 3))))
latexify(string(integrate(exp(-a * x) * sin(x), x)))

out = sympy.Derivative(x^x, x)
latexify(string(out))

out.doit()
latexify(string(out.doit()))

x = Sym("x")

@vars a b c

a, b, c = Sym("a,b,c")

u = symbols("u")

x = symbols("x", real = true)

y1, y2 = symbols("y1, y2", positive = true)

alpha = symbols("alpha", integer = true, positive = true)

solve(x^2 + 1)   # ±i are not real

solve(y1 + 1)    # -1 is not positive

@vars u1 u2 positive = true

solve(u1 + u2)  # empty, though solving u1 - u2 is not.

@vars a1 => "α₁" a2 => "α₂"

PI, oo

[asin(1), asin(Sym(1))]

@vars x y

ex = x^2 + 2x + 1
latexify(string(ex.subs(x, y)))
latexify(string(ex.subs(x, 0)))

x, y, z = symbols("x,y,z")

ex = x + y + z
ex.subs((x, 1), (y, pi))
ex(x => 1, y => pi)
ex(1, pi)

N(PI)
(PI).evalf()
PI.evalf(30)
N(PI.evalf(30))

@vars x y z

p = x^2 + 3x + 2

latexify(string(factor(p)))
latexify(string(expand(prod((x - i) for i = 1:5)))
latexify(string(factor(x^2 - 2)))

q = x * y + x * y^2 + x^2 * y + x

latexify(string(collect(q, x))
latexify(string(collect(q, y))
latexify(string(simplify(q))
expand((x + 1) * (x - 2) - (x - 1) * x)
latexify(string(factor(exp(2x) + 3exp(x) + 2)))

r = 1 / x + 1 / x^2
latexify(string(together(r))
latexify(string(apart((4x^3 + 21x^2 + 10x + 12) / (x^4 + 5x^3 + 5x^2 + 4x))))

top = (x - 1) * (x - 2) * (x - 3)
bottom = (x - 1) * (x - 4)
top / bottom

r = expand(top) / expand(bottom)

cancel(r)

@vars x y nonnegative = true a real = true

simplify(x^a * y^a - (x * y)^a)

x, y, a = symbols("x,y,a")

simplify(x^a * y^a - (x * y)^a)

sympy.powsimp(x^a * y^a - (x * y)^a, force = true)

θ = symbols("θ", real = true)

p = cos(θ)^2 + sin(θ)^2;

simplify(p)

simplify(sin(2theta) - 2sin(theta) * cos(theta))

sympy.expand_trig(sin(2theta))

a, b, c, x = symbols("a, b, c, x")

p = a * x^2 + b * x + c

p.coeff(x^2) # a

p.coeff(x)   # b

p(x => 0)

Sym[[p.coeff(x^i) for i = N(degree(p, gen = x)):-1:1]; p(x => 0)]

try
    p.coeffs()
catch err
    "ERROR: KeyError: key `coeffs` not found"
end # wrap p.coeffs() for doctest of error

q = sympy.Poly(p, x)

q.coeffs()

real_roots(x^2 - 2)

p = (x - 3)^2 * (x - 2) * (x - 1) * x * (x + 1) * (x^2 + x + 1)
latexify(string(p))

real_roots(p)

solve(p)
roots(p)

p = x^5 - x + 1
roots(p)

rts = solve(p)
N.(rts)
nroots(p)
solve(cos(x) - sin(x))
u = solveset(cos(x) - sin(x))
v = solveset(x^2 - 4)
collect(Set(v...))
elements(v)
try  solve(cos(x) - x)  catch err "error" end # wrap command for doctest of error
nsolve(cos(x) - x, 1)
a,b,c  = symbols("a,b,c", real=true)
p = a*x^2 + b*x + c
solve(p, x)
latexify(string(solveset(p, x)))

solve(p)

x, y = symbols("x,y", real=true)
exs = [2x+3y-6, 3x-4y-12]
d = solve(exs)

map(ex -> ex.subs(d), exs)

A = Sym[2 3; 3  -4]
b = Sym[6, 12]

A \ b

a,b,c,h = symbols("a,b,c,h", real=true)

p = a*x^2 + b*x + c

fn = cos

exs = [fn(0*h)-p(x=>0), fn(h)-p(x => h), fn(2h)-p(x => 2h)]

d = solve(exs, [a,b,c])

quad_approx = p.subs(d)
latexify(string(quad_approx))

n = 3

x, c = symbols("x,c")

as = Sym["a$i" for i in 0:(n-1)]

bs = Sym["b$i" for i in 0:(n-1)]

p = sum([as[i+1]*x^i for i in 0:(n-1)])

q = sum([bs[i+1]*(x-c)^i for i in 0:(n-1)])

solve(p-q, bs)

solve(Eq(x, 1))

solve(x ⩵ 1)

x, y = symbols("x,y", real=true)

exs = [2x+3y ⩵ 6, 3x-4y ⩵ 12]    ## Using \Equal[tab]

d = solve(exs)

Eq.( [2x+3y,3x-4y], [6,12]) |>  solve == d

using Plots

@vars x
plot(x^2 - 2, -2,2)

plot(sin(2x), cos(3x), 0, 4π)


ex = cos(x)^2  +  cos(x^2)
fn = lambdify(ex)
xs = range(0, stop=10, length=256)
plot(xs, fn.(xs))

limit(sin(x)/x, x, 0)

limit(sin(x)/x, x=>0)

limit((1+1/x)^x, x => oo)

a = symbols("a", positive=true)

ex = (sqrt(2a^3*x-x^4) - a*(a^2*x)^(1//3)) / (a - (a*x^3)^(1//4))
latexify(string(ex))

ex(x=>a)         # or subs(ex, x, a)

denom(ex)(x => a), numer(ex)(x => a)

limit(ex, x => a)

quad_approx  |>  string

limit(quad_approx, h => 0)

limit(sign(x), x => 0)

limit(sign(x), x => 0, dir="-"), limit(sign(x), x => 0, dir="+")

f(x) = 1/x^(log(log(log(log(1/x)))) - 1)

hs = [10.0^(-i) for i in 6:16]

ys = [f(h) for h in hs]

[hs ys]

limit(f(x), x, 0, dir="+")

x, h = symbols("x,h")

f(x) = exp(x)*sin(x)

limit((f(x+h) - f(x)) / h, h, 0)

diff(f(x), x)

diff(x^x, x)

diff(exp(-x^2), (x, 2)) |>  string

diff(exp(-x^2), x, x, x) |>  string     # same as diff(..., (x, 3))

f(x) = (12x^2 - 1) / (x^3)

diff(f(x), x) |> solve

x,y = Sym("x,y")

ex = x^2*cos(y)

[diff(ex,v1, v2) for v1 in [x,y], v2 in [x,y]]  # also hessian(ex, (x,y))

ex = sympy.Derivative(exp(x*y), x, (y, 2))

ex.doit() |> string

F, G = SymFunction("F"), SymFunction("G")

F(x)

diff(F(x))

x,y = symbols("x, y")

ex = y^4 - x^4 - y^2 + 2x^2

ex1 = ex(y=>F(x))

ex2 = diff(ex1, x)

ex3 = solve(ex2, F'(x))[1]

ex4 = ex3(F(x) => y)

w, h, P = symbols("w, h, P", nonnegative=true)

r = w/2

A = w*h + 1//2 * (pi * r^2)
string(A)

p = w + 2h + pi*r
string(p)

h0 =  solve(P-p, h)[1]

A1 = A(h => h0)

sympy.Poly(A1, w).coeffs()

collect(expand(A1), w).coeff(w^2)

A1(w => 0)

b = solve((P-p)(h => 0), w)[1]

c = solve(diff(A1, w), w)[1]

atb = A1(w => b)
latexify(string(atb))

atc = A1(w => c)
latexify(string(atc))

atc - atb |> string

simplify(atc - atb) |> string

integrate(x^3, x)

n = symbols("n", real=true)

ex = integrate(x^n, x)

ex(n => 3)

integrate(x^2, (x, 0, 1))

integrate(x^5*sin(x), x)

ex = (x^4 + x^2*exp(x) - x^2 - 2*x*exp(x) - 2*x - exp(x))*exp(x)/((x - 1)^2*(x + 1)^2*(exp(x) + 1))

integrate(ex, x) |> string

x, y = symbols("x,y")

integrate(x*y, (y, 0, 1), (x, 0, 1))

integrate(x^2*y, (y, 0, sqrt(1 - x^2)), (x, -1, 1))

integ = sympy.Integral(sin(x^2), x)
integ.doit()  |>  string

s1 = series(exp(sin(x)), x, 0, 4)
string(s1)

s2 = series(cos(exp(x)), x, 0, 6)
string(s2)

simplify(s1 * s2) |> string

s1.removeO() |> string

i, n = symbols("i, n")

summation(i^2, (i, 1, n)) |> string

sn = sympy.Sum(1/i^2, (i, 1, n))
string(sn)

limit(sn.doit(), n, oo) |> string

x,y = symbols("x,y")

v = [1,2,x]

w = [1,y,3]

using LinearAlgebra

dot(v,w) |> string

cross(v,w)

ex = x^2*y - x*y^2

Sym[diff(ex,var) for var in (x,y)]

diff.(ex, (x,y))

Sym[diff(ex, v1, v2) for v1 in (x,y), v2 in (x,y)]

hessian(ex, (x,y))

x,y = symbols("x,y")

M = [1 x; x 1]

import PyCall: PyObject

A = sympy.Matrix([[1,PyObject(x)], [PyObject(y), 2]])

diagm(0=>ones(Sym, 5))

M^2

det(M)

A^2

det(A)

A.det()

eigvecs(M)

A.eigenvects()

A = Sym[1 2 3 0 0; 4 10 0 0 1]

vs = A.nullspace()

[A*vs[i] for i in 1:3]

A = [1 x; x 1]

P, D = A.diagonalize()  # M = PDP^-1

A - P*D*inv(P)

F = SymFunction("F")

diffeq = Eq(diff(F(x), x, 2) - 2*diff(F(x)) + F(x), sin(x))
string(diffeq)

ex = dsolve(diffeq, F(x))
string(ex)

diffeq = F''(x) - 2F'(x) + F(x) - sin(x)
string(diffeq)

sympy.dsolve(diffeq, F(x)) |> string

ex1 = ex.rhs()
string(ex1)

C1 = first(free_symbols(ex1))
solve(ex1(x => 0), C1)

ex2 = ex1(C1 => -Sym(1//2)); string(ex2)
C2 = free_symbols(ex1)[2]

solve( diff(ex2, x)(x => 0) - 1, C2 )
ex3 = ex2(Sym("C2") => 3//2)
string(ex3)


t, m, k, alpha = symbols("t,m,k,alpha")
v = SymFunction("v")

M = Sym[6 5 -2 -3; -3 -1 3 3; 2 1 -2 -3; -1 1 5 5]
ex = Eq( (m/k)*v'(t), alpha^2 - v(t)^2 )

sympy.classify_ode(ex)
dsolve(ex, v(t)) |> string

y = SymFunction("y")
a, x = symbols("a,x")
eqn = y'(x) - 3*x*y(x) - 1
string(eqn)
x0, y0 = 0, 4
out = dsolve(eqn, x, ics = (y, x0, y0))
string(out)
u = out.rhs()
string(u)
x0, y0 = 0, a
out = dsolve(eqn, x, ics=(y, x0, y0))
string(out)


as = -2:0.6:2
fn = lambdify(subs(out.rhs(), a=>first(as)))
xs = range(-1.8, 1.8, length=500)
p = plot(xs, fn.(xs), legend=false, ylim=(-4,4))
for aᵢ in as[2:end]
    fn  = lambdify(subs(out.rhs(), a=>aᵢ))
    plot!(p, xs, fn.(xs))
end
p

y = SymFunction("y")
x = symbols("x")
eqn = y''(x) + 5y'(x) + 6y(x)
string(eqn)
out = dsolve(eqn, x, ics=((y, 0, 1), (y', 0, 1)))
string(out)
plot(out.rhs(), -1/3, 2)
eqn = y''(x) + y(x) - exp(x)
string(eqn)
dsolve(eqn, x, ics=((y, 0, 1), (y, 1, 1//2))) |> string

P, J = M.jordan_form()
J
P


A = Sym[1 1 1; 1 1 3; 2 3 4]
Q, R = A.QRdecomposition()
Q
R


A = Sym[2 3 5; 3 6 2; 8 3 6]
x = Sym[3 7 5]'
b = A*x
soln = A.LUsolve(b)


L = [Sym[2 3 5], Sym[3 6 2], Sym[8 3 6]]
out1 = sympy.GramSchmidt(L)
out2 = sympy.GramSchmidt(L, True)

M = Sym[1 3; 2 0]
M.charpoly()
M.charpoly(x) == M.charpoly(y)

M.charpoly().as_expr()

M = Sym[1 2; x 0]
M.charpoly(x).as_expr()

M.charpoly(x).gen

M.charpoly(x).gen

M = Sym[1 2; 3 4]
M.cofactor(0, 1)

M = Sym[1 2; 3 4]
M.cofactor_matrix()

M = Sym[1 2 3; 4 5 6; 7 8 9]
M.minor(1, 1)

M = Sym[1 2 3; 4 5 6; 7 8 9]
M.minor_submatrix(1, 1)

M = Sym[1 2; 3 4]
M.echelon_form()

#elementary_col_op
#elementary_row_op
#is_echelon

m = Sym[1 2; x 1-1/x]
m.rank()
#https://discourse.julialang.org/t/filling-arrays-in-rows/25097/2
n = sympy.Matrix(collect(reshape(1:9, 3, 3)'))
n.rank()

m = Sym[1 2; x 1-1/x]
m.rref()
rref_matrix, rref_pivots = m.rref()
rref_matrix
rref_pivots

M = sympy.Matrix(reshape([1 3 0 -2 -6 0 3 9 6], 3, 3)')
M.columnspace()
M.nullspace()
M.rowspace()

v = [Sym[1 im], Sym[1 -im]]
#orthogonalize(Sym[1 im], Sym[1 -im])

M = sympy.Matrix(reshape([1 2 0 0 3 0 2 -4 2], 3, 3)')
(P, D) = M.diagonalize()
D
P
P.inv() * M * P

M = sympy.Matrix(reshape([0 1 1 1 0 0 1 1 1], 3, 3)')
M.eigenvals()
M.eigenvects()
M.left_eigenvects()

M = Sym[1 2 0; 0 3 0; 2 -4 2]
M.is_diagonalizable()

x = symbols("x", real=true)
M = Sym[0 1 0; 0 x 0; -1 0 0]
M.singular_values()

x, y = symbols("x y")
M = Sym[x y; 1 0]
M.diff(x)
M.integrate((x, ))
M.integrate((x, 0, 2))

ρ, ϕ = symbols("ρ, ϕ")
X = Sym[ρ*cos(ϕ) ρ*sin(ϕ) ρ^2]
Y = Sym[ρ ϕ]
X.jacobian(Y)
X = Sym[ρ*cos(ϕ) ρ*sin(ϕ)]
X.jacobian(Y)

M = Sym[x y; 1 0]
M.limit(x, 2)

m = Sym[0 1-im -2 -3]
m = sympy.Matrix(Matrix(I, 4, 4) - im*Matrix(I, 4, 4))
m[4, 1] = 2
m

A = Sym[25 15 -5; 15 18 0; -5 0 11]
L, D = A.LDLdecomposition()
L
D
L * D * L' * A.inv()
Matrix(I, A.rows, A.rows)

A = Sym[9 3im; -3im 5]
L, D = A.LDLdecomposition()
L
D
L*D*L.H == A

#Matrix(I, 2, 2)
A = 2sympy.Matrix(sympy.eye(2))
A.LDLsolve(B) == B/2

a = Sym[4 3; 6 3]
L, U, _ = a.LUdecomposition()
L
U

A = Sym[12 -51 4; 6 167 -68; -4 24 -41]
Q, R = A.QRdecomposition()
Q
R

Q * Q.H
Q.H * Q

A == Q*R

A = Sym[12 -51 0; 6 167 0; -4 24 0]
Q, R = A.QRdecomposition()
Q
R

Q.H * Q
Q * Q.H

#Q_aug = Q.row_join([0 0 0])
#R_aug = R.col_join(sympy.Matrix([[0, 0, 0]]))
#Q_aug = Q_aug.QRdecomposition()[0]

A = sympy.Matrix(zeros(3, 4)
Q, R = A.QRdecomposition()
Q
R
#Q*R

x = symbols("x")
S = sympy.S
m = Sym[S(5)/4 S(3)/4; S(3)/4 S(5)/4]
f = log(x)
m.analytic_func(f, x)

A = Sym[25 15 -5; 15 18 0; -5 0 11]
A.cholesky()

A.cholesky() * A.cholesky().T

A = Sym[9 3im; -3im 5]
A.cholesky()
A.cholesky() * A.cholesky().H

A = Sym[1 2; 2 1]
L = A.cholesky(hermitian=False)
L*L.T == A

A = Sym[1 0 0; 0 10 0; 0 0 S.One/10]
A.condition_number()

a, b, c, d, e, f, g, h = symbols("a:h")

A = Sym[a 0 b 0; 0 e 0 f; c 0 d 0; 0 g 0 h]
A.connected_components()

P, B = A.connected_components_decomposition()
P = P.as_explicit()
P_inv = P.inv().as_explicit()
B = B.as_explicit()
P * B * P_inv

A = sympy.Matrix(collect(reshape(1:4, 2, 2)'))
A.copy()

A = sympy.Matrix(2Matrix(I, 2, 2))
B = Sym[1 2; 3 4]
A.diagonal_solve(B) == B/2

M = Sym[1 2 3; 4 5 6; 7 8 9]
v = Sym[1 1 1]
M.row(0).dot(v)
M.col(0).dot(v)
v = Sym[3 2 1]
M.row(0).dot(v)

q = Sym[im im im]
q.dot(q, hermitian=False)
q.dot(q, hermitian=True)

q1 = Sym[1 1 1 im]
#q.dot(q1, hermitian=True, conjugate_convention="maths")
#q.dot(q1, hermitian=True, conjugate_convention="physics")

t = symbols("t")
m = Sym[0 1; -1 0]*t
m.exp()


A = sympy.Matrix([[1, 2, 1, 1], [1, 2, 2, -1], [2, 4, 0, 6]])
B = sympy.Matrix([7, 12, 4])
sol, params = A.gauss_jordan_solve(B)
sol[1]
sol[2]
sol[3]
sol[end]
params[1]
params[end]

A = sympy.Matrix([[1, 2, 3], [4, 5, 6], [7, 8, 10]])
B = sympy.Matrix([3, 6, 9])
sol, params = A.gauss_jordan_solve(B)
sol
params

A = sympy.Matrix([[2, -7], [-1, 4]])
B = sympy.Matrix([[-21, 3], [12, -2]])
sol, params = A.gauss_jordan_solve(B)
sol
params

A = sympy.Matrix([[1, 2, 1, 1], [1, 2, 2, -1], [2, 4, 0, 6]])
B = sympy.Matrix([7, 12, 4])
sol, params, freevars = A.gauss_jordan_solve(B, freevar=True)
sol
params
freevars

#A = sympy.SparseMatrix(Sym[2 -1 0; -1 2 -1; 0 0 2])
#A.inv
#A.inv(method='LDL') # use of 'method=' is optional
#A * _
#A = Matrix(A)
#A.inv('CH')
#A.inv('ADJ') == A.inv('GE') == A.inv('LU') == A.inv('CH') == A.inv('LDL') == A.inv('QR')
A = sympy.Matrix(collect(reshape(1:4, 2, 2)'))
A.inv_mod(5)
A.inv_mod(3)

sympy.Matrix.irregular(3, sympy.ones(2,1), sympy.ones(3,3)*2, sympy.ones(2,2)*3,
sympy.ones(1,1)*4, sympy.ones(2,2)*5, sympy.ones(1,2)*6, sympy.ones(1,2)*7)

a = Sym[0 0 0; 1 0 0; 1 1 0]
a.is_nilpotent()

a = Sym[1 0 1; 1 0 0; 1 1 0]
a.is_nilpotent()

m = Sym[1 1; 0 1]
m.log()

m = Sym[S(5)/4 S(3)/4; S(3)/4 S(5)/4]
m.log()

m = Sym[S(3)/4 S(5)/4; S(5)/4 S(3)/4]
m.log()

m = Sym[0 0 0 1; 0 0 1 0; 0 1 0 0; 1 0 0 0]
m.log()

v = Sym[cos(x) sin(x)]
sympy.trigsimp( v.norm() )
v.norm(10)
(sin(x)**10 + cos(x)**10)**(1/10)
A = Sym[1 1; 1 1]
A.norm(1) # maximum sum of absolute values of A is 2
A.norm(2) # Spectral norm (max of |Ax|/|x| under 2-vector-norm)
A.norm(-2) # Inverse spectral norm (smallest singular value)
A.norm() # Frobenius Norm
A.norm(oo) # Infinity Norm
Sym[1 -2].norm(oo)
Sym[-1 2].norm(-oo)


A = Sym[1 2 3; 4 5 6]
A.pinv()

#B = A.sympy.pinv(method='ED')
#B.simplify()
#B

A = sympy.Matrix([[1, 2, 3], [4, 5, 6]])
B = sympy.Matrix([7, 8])
A.pinv_solve(B)
#A.pinv_solve(B, arbitrary_matrix=Matrix([0, 0, 0]))

map(x -> x * 2, [1 2 3; 1 2 3])

f(i, j) = 3i + j
m = sympy.Matrix(collect(reshape([f(i,j) for i=0:1 for j=0:2], 3, 2)'))
m.print_nonzero()
[ XX]
[XXX]
m = sympy.Matrix(Matrix(I, 4, 4))
m.print_nonzero("x")

V = Sym[sqrt(3)/2 sympy.S.Half]
x = Sym[1 0]
V.project(x)
V.project(-x)


A = Sym[1 3 1 4; 2 7 3 9; 1 5 3 1; 1 2 0 8]
C, F = A.rank_decomposition()
C
F
C * F == A

A = Sym[1 2 3]
B = Sym[2 3 4]
S = Matrix(A.row_join(B))

#r = S*Sym[2 3]
xy = S.solve_least_squares(Sym[8 14 18])

sympy.diag(Sym[1 2 3], unpack=True)  # = diag(1,2,3) or diag(*[1,2,3])

diag(Sym[1 2 3])  # a column vector

x, y= Sym("x y")
sympy.jordan_cell(x, 4)
#g2 = x^2 + 3y
#hessian(F, (x, y), [G, g2])

M.is_diagonalizable(reals_only=False)
M.is_diagonalizable(reals_only=True)

a, b = symbols("a b")
x = Sym[a b]

A = Sym[1 0; 0 1]
A.is_positive_definite
A.is_positive_semidefinite

A = Sym[1 -1; -1 1]
A.is_positive_definite
A.is_positive_semidefinite


A = Sym[-1 0; 0 -1]
A.is_negative_definite
A.is_negative_semidefinite
A.is_indefinite

A = Sym[1 2; 2 -1]
A.is_indefinite

A = Sym[1 2; -2 1]
A.is_positive_definite
A.is_positive_semidefinite

M = Sym[1 2 3; -2 0 4]
M.shape
size(M)

M.row(0)
M.col(-1)

M[1,:], M[:, end]

M = sympy.ImmutableMatrix([1 2 3; -2 0 4])  # avoid vector of row vector construction ⎡1   2  3⎤

M.col_del(0)
M.row_del(1)

M = Sym[3 -2  4 -2; 5  3 -3 -2; 5 -2  2 -2; 5 -2 -3  3]

M.eigenvals()
M.eigenvects()
eigvecs(M)

P, D = M.diagonalize()

P
D
P*D*P^-1
P*D*P^-1 == M

λ = symbols("λ")
p = M.charpoly(λ)
factor(p) |>  string
