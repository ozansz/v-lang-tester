int func printTranspose(matrix: int[][], rows: int, cols: int)
    var i: int, j: int;

    for i := 1 to cols
        print "|";

        for j := 1 to rows
            print matrix[j][i], " ";
        endfor;

        print "|\n";
    endfor;

    % return 0 by default
endfunc

int func main()
    var matrix: int[3][3];
    var i: int, j: int;

    for i := 1 to 3
        for j:= 1 to 3
            print "matrix[", i, "][", j, "] = ";
            read matrix[i][j];
        endfor;
    endfor;

    print "\nMatrix is:\n";

    for i := 1 to 3
        print "|";

        for j:= 1 to 3
            print matrix[i][j], " ";
        endfor;
        
        print "|\n";
    endfor;

    print "\nTranspose of the matrix:\n";

    printTranspose(matrix, 3, 3);

    return 0;
endfunc