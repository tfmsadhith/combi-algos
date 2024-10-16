# Sanjay Adhith

# Singapore, Hillview

# A silly, brute force method for generating
# Langford parings.

using Combinatorics

# Generate all permutations.
setup = []
for i in range(1,4)
    pushfirst!(setup, i)
    pushfirst!(setup, i)
end

println(setup)
permutations(setup)


# Checks if a specific index is paired properly.
# So 2 and 2 should be 2 spaces apart.
function check_index(A, i)
    first_pos = findall(x -> x == i, A)[1]
    second_pos = findall(x -> x == i, A)[2]
    (second_pos - first_pos) == (i + 1)
end

# Checks if a given pairing is a langford pairing.

function test_permute(permute)
    longer =  Int64(length(permute) / 2)
    if sum(map(x -> check_index(permute, x), range(1, longer))) == longer
        1
    else
        0
    end
end


count = sum(collect(filter(x -> x == 1, map(x -> test_permute(x), unique(permutations(setup))))))
count / 2 
