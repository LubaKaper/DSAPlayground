//: [Previous](@previous)

import Foundation

//Shift Zeros
//Given an array of numbers, reset the array to put all the non-zero numbers in front of all the zeros in the array, then return the new array and the count of non-zero numbers.
//Input: [3,0,2,0,0,1,0,4]     Output:  [3,2,1,4,0,0,0,0], 4
  
func shiftZeros(_ input: [Int]) -> ([Int], Int) {
    var output = [Int]()
    var count = 0
    for num in input {
        if num != 0 {
            output.append(num)
        } else if num == 0 {
            count += 1
        }
        
        }
    for _ in 1...count {
    output.append(0)
    }
    
    return (output, count)
}
print(shiftZeros([3,0,2,0,0,1,0,4]))
