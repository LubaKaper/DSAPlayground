import UIKit

// bubble sort
// sort algorithm
// runtime: O(n ^ 2) - quadratic(considered as the worse sorting algorithm)
// space complexity: O(1) - constatnt - sorts in place
// sorts in place - inout function

func bubbleSort(_ arr: inout [Int]) {// becuse we are sorting in place, we are not returning anything, we are just manipulating existing array, "inout" indicares inplace manipulation
    for _ in 0 ..< arr.count { //O(n)
        for j in 1 ..< arr.count { // O(n)
            if arr[j] < arr[j-1] {
                // swap
                // implement swap without using built in swap func
                let temp = arr[j] // saved the value at arr[j] before overwriting
                arr[j] = arr[j-1]
                arr[j-1] = temp
            }
        }
        
    }
}

var list = [10, 2, -8, 4]
bubbleSort(&list)

print(list)





// from AHAD
public func bubbleSort<T: Comparable>(_ array: inout [T]) {
  guard array.count >= 2 else {
    return
  }

  for end in (1..<array.count).reversed() {
    var swapped = false

    for current in 0..<end {
      // array[0] > array[1]
      // input [ 5, 2, 3, 1]
      // array[0] = 5, array[1] = 2
      // 5 > 2
      // array[0] = 2, array[1] = 5
      // array[1] > array[2]
      // array[2] = 5, array[1] = 3

      if array[current] > array[current + 1] {
        array.swapAt(current, current + 1)
        swapped = true
      }
    }

    if !swapped {
      return
    }
  }
}

print()
//print(sortArray(input) == output)
//print(sortArray(input))
//print(output)
//
//bubbleSort(&input)
//print(input)
//print(input == output)
// problem 4
// https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/
