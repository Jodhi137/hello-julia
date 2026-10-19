using Plots

println("Hello World!")

function solve_quad(a, b, c)
    d = b^2 - 4*a*c

    if d < 0
        root1 = (-b + sqrt(Complex(d))) / (2*a)
        root2 = (-b - sqrt(Complex(d))) / (2*a)
        return root1, root2
    elseif d == 0
        return -b / (2*a)
    else
        root1 = (-b + sqrt(d)) / (2*a)
        root2 = (-b - sqrt(d)) / (2*a)
        return root1, root2
    end
end


println(solve_quad(1, -3, 2))  # (2.0, 1.0)
println(solve_quad(1, 2, 1))   # -1.0
println(solve_quad(1, 0, 1))   # (0.0 + 1.0im, 0.0 - 1.0im)

x = range(0, 10, length=1000)
y = sin.(x)
plot(x, y)