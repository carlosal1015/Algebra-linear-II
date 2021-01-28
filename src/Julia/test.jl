using LinearAlgebra, GenericLinearAlgebra
m = Hermitian(rand(Complex{BigFloat}, 5, 5));
eigen(m)


roots(Polynomial([-1, 2, -1, 2]))[1]
round(roots(Polynomial([-1, 2, -1, 2]))[1])
round(roots(Polynomial([-1, 2, -1, 2]))[2])
round(roots(Polynomial([-1, 2, -1, 2]))[3])

-im^3 + 2*im^2 - im + 2
p(λ) = -λ³ + 2λ² - λ + 2
