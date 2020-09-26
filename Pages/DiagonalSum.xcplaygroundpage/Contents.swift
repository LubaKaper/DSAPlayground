//: [Previous](@previous)

import Foundation

func getDiagnolSum(_ matrix: [[Int]]) -> Int {
    var sum = 0
    for i in 0..<matrix.count { // 0, 1, 2
        sum += matrix[i][i]
        sum += matrix[i][matrix.count - 1 - i]
        // i = 0, 2 - 0 = 2 -> [0][2]
        // i = 1, 2 - 1 = 1 -> [1][1]
    }
    // 2, 1, 0
    return sum
}

func getMatrixSum(matrix: [[Int]]) -> Int {
    var sum = 0
    //O(n)
    for i in 0..<matrix.count { // 0 1 2
        for j in 0..<matrix[0].count { // 0 1 2 3
         // make sure its not a corner
            if (i == 0 || i == matrix.count - 1) && (j == 0 ||  j == matrix[0].count - 1 ){
                continue // skip
            }
            sum += matrix[i][j]
        }
    }
    return sum
}

let matrix = [[2,2,0],
              [1,2,3],
              [1,2,3]]

print(getMatrixSum(matrix: matrix))
print(getDiagnolSum(matrix))
