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
    sum(map(x -> check_index(permute, x), range(1, longer))) == longer
end

count = sum(collect(filter(x -> x == 1, map(x -> test_permute(x), unique(permutations(setup))))))
count / 2 

# Knuth also considers Langford pairings which are
# "optimum" in various ways.

test_term = [16, 6, 9, 15, 2, 3, 8, 2, 6, 3, 13, 10, 9, 12, 14, 8, 11, 16, 1, 15, 1, 5, 10, 7,
             13, 4, 12, 5, 11, 14, 4, 7]

# Principle of moments.
function check_balanced(permute)
  longer = Int64(length(permute)) / 2

  left_moment = 0
  for i in range(1, longer)
    left_moment += permute[Int64(i)] * (longer - i + 0.5)
  end

  right_moment = 0
  for i in range(longer + 1, longer * 2)
    right_moment += permute[Int64(i)] * (i - longer - 0.5)
  end

  left_moment == right_moment
end

println(test_term)
check_balanced(test_term)

# To implement the other kind of balance Knuth
# describes, simply comment out the factor the
# moment is multiplied by.