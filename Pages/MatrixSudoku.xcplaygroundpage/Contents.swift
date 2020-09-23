//: [Previous](@previous)

import Foundation

func isSubSudoku2(board: [[Int]]) -> Bool {
    let count = board.count
    for i in 0..<count { // O(n)
        var rowValues = Array(repeating: false, count: count)
        var colValues = Array(repeating: false, count: count) // [false, false, false ]
        for j in 0..<count {
            let rowVal = board[i][j] // 4
            let colVal = board[j][i] // 4
            if colVal - 1 >= count || colValues[colVal - 1]  {
                return false // repeat found
            } else {
                colValues[colVal - 1] = true
            }
            if rowVal - 1 >= count || rowValues[rowVal - 1] {
                return false // repeat found
            } else {
                rowValues[rowVal - 1] = true
            }
        }
    }
    return true
}
