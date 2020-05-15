import UIKit

// Quicksort implementation using Lomuto's PArtitionimng Algorithm
// Quicksort uses a pivot in our example we use the last element(Lomoto's Partitioning) as the pivot
// using this pivot we split the array to the left of thre pivot and to the right of the pivot
// example: 10, -9, 0, -11, (pivot is 13), 80
// quicksort usees divide and conquer approach to solve the sorting algorithm, divide and conquer is splitting the problem in half on every iteration(or recursive call)
// runtime: O(n log n)
// implement Lomoto's partitioning

// return new index which we will use as the pivot tompartition
// the array      inyo a left and right side

func lomotoPartition(_ arr: inout [Int], low: Int, high: Int) -> Int {
    let pivot = arr[high]// using last element in the array
    var i = low
    // iterate through array using j variable as our marker
    for j in low..<high {
        if arr[j] <= pivot {
            // swap and increment i
            arr.swapAt(i, j)
            i += 1
    }
}
    arr.swapAt(i, high)
    
    return i
}


func quicksortLomoto(_ arr: inout [Int], low: Int, high: Int) {
    if low < high {
       // get new pivot
        let pivot = lomotoPartition(&arr, low: low, high: high)
        // recursive calls
        // left array
        quicksortLomoto(&arr, low: low, high: pivot - 1)
        // right array
        quicksortLomoto(&arr, low: pivot + 1, high: high)
    }
}

var list = [80,10,-9,0,-11,13, 80,10,-9,0,-11,13, 80,10,-9,0,-11,13, 78, -100]

quicksortLomoto(&list, low: 0, high: list.count - 1)

print(list)

// bubble sort - worst sorting algorithm
func bubbleSort(_ arr: inout [Int]) {
    for _ in 0..<arr.count { // n
        for j in 1..<arr.count { // n=> O(n ^ 2)
            if arr[j] < arr[j-1] {
                arr.swapAt(j, j-1)
            }
        }
    }
}
var bubbleList = [80,10,-9,0,-11,13, 80,10,-9,0,-11,13, 80,10,-9,0,-11,13, 78, -100]
bubbleSort(&bubbleList)
print(bubbleList)

