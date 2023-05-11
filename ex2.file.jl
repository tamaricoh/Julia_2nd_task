
using Pkg
Pkg.add("Plots")
Pkg.add("LinearAlgebra")
using LinearAlgebra
using Plots

function polynomial_interpolation(f,n)
    x = [-1 + (j/n) for j in 0:2n]
    A = hcat([x.^ k for k in 0:2n]...)
    coeffs = A \ f.(x)
    calculate_polynomial(x) = sum(c * x.^(k) for (c,k) in zip(coeffs,0:2n))
    x_inter = -1:0.01:1
    y_inter = calculate_polynomial(x_inter)
    plot!(x_inter, y_inter, label="Interpolation for n=$n")
end


function task_1_1()
    x = -1:0.01:1
    f(x) = -1<=x<=0 ? 1+x : 1-x
    plot(x,f.(x) , label="Original function")
    task_1(f)
end

function task_1_2()
    x = -1:0.01:1
    f(x) = 1/(1+25x^2)
    plot(x,f.(x) , label="Original function")
    task_1(f)
end

function task_1(f)
    polynomial_interpolation(f,3)
    polynomial_interpolation(f,4)
    polynomial_interpolation(f,5)
    polynomial_interpolation(f,6)
end

task_1_1()
task_1_2()