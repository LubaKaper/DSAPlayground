import UIKit

// merge sort
// worst, best and average runtime is O(n log n)
// uses divide and conquer
//splits arrays in 2 using middle index
// uses recursion until basecase count is 1
// then merges individual arrays back together while sorting
func mergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    // base case count is f=greater then 1
    guard arr.count > 1 else {return arr}
    let middleIndex = arr.count / 2
    
    // left array includes beginnin of array up to but not including the middle index
    let leftArr = mergeSort(Array(arr[..<middleIndex]))
    
    let rightArray = mergeSort(Array(arr[middleIndex...]))
    
    return merge(leftArr, rightArray)
}

// cobine 2 sorted arrays
func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
   var leftIndex = 0 // kinda like counters
    var rightIndex = 0
    var resultArray = [T]()
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        //compare
        if leftElement < rightElement {
            resultArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultArray.append(rightElement)
            rightIndex += 1
        } else {
            resultArray.append(leftElement)
            leftIndex += 1
            resultArray.append(rightElement)
            rightIndex += 1
        }
    }
    // herw append elementsremaining in left, right ArraySlice
    if leftIndex < leftArray.count {
        resultArray.append(contentsOf: leftArray[leftIndex...])
    }
    if rightIndex < rightArray.count {
        resultArray.append(contentsOf: rightArray[rightIndex...])
    }
    return resultArray
}
 
let list = [12, 8, 29, -100, 0, 234]
let sortedList = mergeSort(list)
print(sortedList)
