
# Working on Ozanam's puzzle from Recreations
# mathematiques et physiques.

# Knuth tells us not to turn the page until having given
# the problem a try. Well, I suppose I should give it a try. 

using Random

# Perhaps there are better ways than this!
for i in range(1,1000000)
    Random.seed!(rand(RandomDevice(), 1:1000))

    board = [[[1,1], [2,1], [3,1], [4,1]],
            [[1,2], [2,2], [3,2], [4,2]],
            [[1,3], [2,3], [3,3], [4,3]],
            [[1,4], [2,4], [3,4], [4,4]]]

    board = shuffle(board)

    flat_board = [(board...)...]
    board = [flat_board[1:4], flat_board[5:9], flat_board[10:13], flat_board[13:16]]


    # If all the entries are 10 we are good.

    # Checks values.

    row_values = map(r -> sum(map(x -> x[1], r)), board)
    column_values = map(r -> sum(map(x -> x[1], r)), transpose(board))


    # Checks suites.
    row_suites = map(r -> sum(map(x -> x[2], r)), board)
    column_suites = map(r -> sum(map(x -> x[2], r)), transpose(board))

    row_count_values = size(filter(x -> x == 10, row_values))[1]
    column_count_values = size(filter(x -> x == 10, column_values))[1]
    row_count_suite = size(filter(x -> x == 10, row_suites))[1]
    column_count_suite = size(filter(x -> x == 10, column_suites))[1]

    if (row_count_values + column_count_values + row_count_suite +  column_count_suite)  == 16
        println(board)
    end
end