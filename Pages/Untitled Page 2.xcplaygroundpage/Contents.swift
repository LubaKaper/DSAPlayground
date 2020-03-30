import UIKit

// bianry serch - implements usng recursion

// runtime: O(log n) - as array is deviding on  each pass
// array must be sorted
// array is devided in halves to find the middle index
// based on the current value of the middle index we either continue searching we eithe continue searching to the laft or to the right from the index
// we use divide and conquer and implemenyt the steps above until we find value or do not find a value that we sare looking for
// using recursion(could usew while loop instead)
func bianrySearch<T: Comparable>(_  arr: [T], searchKey: T, range: Range<
    Int>) -> Int? {
    // chreck to insure that the upper bound is higher than the lower bound
    // if 5>0 return  nil
    // [4,5,8]
    // lower bound 0
    // upper bound 2
    if range.lowerBound >= range.upperBound {
        return nil
    }
    // calculate middle index
    let middleindex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    // 3 checks
    // 1. is middle index value equal to search key(if it is , we have found the search key)
    // 2. if the value in the middle index is greater then search key,we are looking on the left side
    // 3. if the value in the middle index is less then search key,we are looking on the right side
    // check 1
    if arr[middleindex] == searchKey {
        return middleindex
    }
    // check 2
    else if arr[middleindex] > searchKey { // left side of middle index
        return bianrySearch(arr, searchKey: searchKey, range: range.lowerBound..<middleindex)
        
    }
    // check 3
    else if arr[middleindex] < searchKey {
        return bianrySearch(arr, searchKey: searchKey, range: middleindex + 1..<range.upperBound)
    }
    return nil
}

let sortedlist = [2, 6, 9, 13, 34, 99, 101]
let index = bianrySearch(sortedlist, searchKey: 99, range: (0..<sortedlist.count))
print("found index: \(index ?? -999)")

let characters = ["a", "b", "c", "f", "l", "p"]

let charIndex = bianrySearch(characters, searchKey: "l", range: (0..<characters.count))
print("found char at index: \(index ?? -999)")
