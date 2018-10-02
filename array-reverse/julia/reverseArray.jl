"""
This method will reverse an array in a hearbeat

array = [1,2,3,4,5,6,7,8,9,10]
return [10,9,8,7,6,5,4,3,2,1] 
"""
function reverseArray(array)
    lastIdx = length(array)
    for i = 1:length(array) >> 1
        array[lastIdx], array[i] = array[i], array[lastIdx]
        lastIdx -= 1
    end
    return array
end

"""
This method takes two parameters: listSize, iterations

#Example
```julia-repl
julia>@time runIterations(100000, 100000)
8.862946 seconds (24.94 k allocations: 2.056 MiB, 0.12% gc time)
```
"""
function runIterations(listSize, iterations)
    numberList = collect(1:listSize)
    for i = 1:iterations
        reverseArray(numberList)
    end
end

"""
This method takes two parameters: listSize, iterations
It uses built-in reverse which is very slow for large iterations > 10000
You've been warned!

#Example
```julia-repl
julia>@time runIterationsBuiltIn(100000, 10000)
5.760353 seconds (20.01 k allocations: 7.452 GiB, 23.04% gc time)
```
"""
function runIterationsBuiltIn(listSize, iterations)
    numberList = collect(1:listSize)
    for i = 1:iterations
        reverse(numberList)
    end
end
