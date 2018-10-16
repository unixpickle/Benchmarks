function addUpTo(dest)
    summation = 0
    d = dest + 1
    for i = 1:d
        summation += i
    end
    return summation
end

function rollAverage(dest)
    average = 0.0
    for i = 0:dest
        average = (average + addUpTo(i)) / 2
    end
    return average
end

"""
This method takes two parameters: start, endl

#Example
```julia-repl
julia>include("path/rollAverage.jl")
julia>@time main(1, 100000)
2.798272 seconds (261.73 k allocations: 7.048 MiB, 10.95% gc time)
```
"""
function main(start, endl)
    while start <= endl
      println("rollAverage(", start, ") = ", rollAverage(start))
      start += 1
    end
end
