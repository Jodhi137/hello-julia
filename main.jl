using Plots
using LaTeXStrings

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


println(solve_quad(1, -3, 2))
println(solve_quad(1, 2, 1))
println(solve_quad(1, 0, 1))
println("\nPolynomial Graphing:")
flush(stdout)
println("Enter a:")
flush(stdout)
a = parse(Float64, readline())
println("Enter b:")
flush(stdout)
b = parse(Float64, readline())
println("Enter c:")
flush(stdout)
c = parse(Float64, readline())

x = -10:0.1:10
y = @. a * x^2 + b * x + c
println("The polynomial is: $a x^2 + $b x + $c")

roots = solve_quad(a, b, c)
real_roots = Float64[]
if roots isa Tuple
    println("The roots are: $roots")
    if all(isreal, roots)
        append!(real_roots, roots)
    end
else
    println("The root is: $roots")
    if isreal(roots)
        push!(real_roots, roots)
    end
end

x_limit = 10.0
y_limit = 10.0

plot(x, y,
    title = "y = $(a)x^2 + $(b)x + $(c)",
    xlabel = L"x",
    ylabel = L"y",
    label = L"y = ax^2 + bx + c",
    linewidth = 2,
    xlims = (-x_limit, x_limit),
    ylims = (-y_limit, y_limit),
    legend = :top)

hline!([0], color = :black, linewidth = 1, label = "")
vline!([0], color = :black, linewidth = 1, label = "")

if !isempty(real_roots)
    scatter!(real_roots, zeros(length(real_roots)),
        label = "Real roots", color = :red, markersize = 8, marker = :x)
end
