using LinearAlgebra

A = [1 2 3; 4 1 6; 7 8 1]

tr(A)

det(A)

A = [-4. -17.; 2. 2.]

eigvals(A)

eigvecs(A)

A = [1.5 2 -4; 3 -1 -6; -10 2.3 4]

factorize(A)

B = [1.5 2 -4; 2 -1 -3; -4 -3 5]

factorize(B)

B = [1.5 2 -4; 2 -1 -3; -4 -3 5]

sB = Symmetric(B)

x = [1; 2; 3]

sB\x

U = UniformScaling(2);

a = [1 2; 3 4]

a + U

a * U

[a U]

b = [1 2 3; 4 5 6]

b - U

[1 1; 0 1] * [1 0; 1 1]

A = [1 0; 1 -2]; B = [32; -4];

X = A \ B

A * X == B

dot([1; 1], [2; 3])

dot([im; im], [1; 1])

dot(1:5, 2:6)

x = fill(2., (5,5));

y = fill(3., (5,5));

dot(x, y)

a = [0;1;0]

b = [0;0;1]

cross(a,b)

A = Array(Bidiagonal(fill(1.0, (5, 5)), :U))

factorize(A)

A = [1 2 3; 4 5 6; 7 8 9]

Diagonal(A)

V = [1, 2]

Diagonal(V)

dv = [1, 2, 3, 4]

ev = [7, 8, 9]

Bu = Bidiagonal(dv, ev, :U)

Bl = Bidiagonal(dv, ev, :L)

A = [1 1 1 1; 2 2 2 2; 3 3 3 3; 4 4 4 4]

Bidiagonal(A, :U)

Bidiagonal(A, :L)

dv = [1, 2, 3, 4]

ev = [7, 8, 9]

SymTridiagonal(dv, ev)

A = SymTridiagonal(fill([1 2; 3 4], 3), fill([1 2; 3 4], 2));

A[1,1]


A[1,2]

A[2,1]

A = [1 2 3; 2 4 5; 3 5 6]

SymTridiagonal(A)

B = reshape([[1 2; 2 3], [1 2; 3 4], [1 3; 2 4], [1 2; 2 3]], 2, 2);

SymTridiagonal(B)

dl = [1, 2, 3];

du = [4, 5, 6];

d = [7, 8, 9, 0];

Tridiagonal(dl, d, du)

A = [1 2 3 4; 1 2 3 4; 1 2 3 4; 1 2 3 4]

Tridiagonal(A)

A = [1 0 2 0 3; 0 4 0 5 0; 6 0 7 0 8; 0 9 0 1 0; 2 0 3 0 4]

Supper = Symmetric(A)

Slower = Symmetric(A, :L)

A = [1 0 2+2im 0 3-3im; 0 4 0 5 0; 6-6im 0 7 0 8+8im; 0 9 0 1 0; 2+2im 0 3-3im 0 4];

Hupper = Hermitian(A)

Hlower = Hermitian(A, :L)

A = [1.0 2.0 3.0; 4.0 5.0 6.0; 7.0 8.0 9.0]

LowerTriangular(A)

A = [1.0 2.0 3.0; 4.0 5.0 6.0; 7.0 8.0 9.0]

UpperTriangular(A)

A = [1.0 2.0 3.0; 4.0 5.0 6.0; 7.0 8.0 9.0]

UnitLowerTriangular(A)


A = [1.0 2.0 3.0; 4.0 5.0 6.0; 7.0 8.0 9.0]

UnitUpperTriangular(A)

A = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]

UpperHessenberg(A)