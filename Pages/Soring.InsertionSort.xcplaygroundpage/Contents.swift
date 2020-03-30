import UIKit

// sorting algorithms:
//slower: O(n ^ 2): bubble sort, insertion sort
//faster: O(n log n): merge sort, quicksort

// insertion sort
// runtime: O(n ^ 2)
// space: O(1)
// slightly more performant than bubble Array
// given a parttially sorted and small arrY COULD BE a good choice sorting algorithm
// swift's sorting algorithm (hybrid alghoritm) is n log n, uses insertion sort on samll, partially sorted arrays

func insertionSAort(_ arr: inout [Int]) {
    guard arr.count >= 2 else { return }
    for current in 1 ..< arr.count { // current represents the index
        for j in (1 ... current).reversed() { // j represents the element
            if arr[j] < arr[j-1] {
                // swap - usinf built in swap
                arr.swapAt(j, j-1)// know how to do it wothout builtin func
            } else { // left side of array is sorted
                break // continue to outer loop
            }
        }
    }
}
var list = [4, 5, 9, -2, -10, 3]
insertionSAort(&list)
print(list)
