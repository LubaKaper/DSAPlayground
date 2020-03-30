//: [Previous](@previous)

import Foundation

// Complete the factorial function below.
func factorial(n: Int) -> Int {
guard n > 1 else {
  return n
}
return n * factorial(n: n-1)
}

print(factorial(n: 3))
// 0, 1, 1, 2, 3, 5, 8....
// finding fibonacci sum at the nth
// nth number the 8000th number, millionth
// OLD
// 3 * factorial(2)
// 3 * 2 * factorial(1)
// 3 * 2 * 1 * factorial(0)
// 3 * 2 * 1 * 1
// 6
// NEW
// 3 * factorial(2)
// 3 * 2 * factorial(1)
// 3 * 2 * 1
// 6

//input 3!
// output 6
//=================================================

// recursion
// multiply number between each other
func multiply(x: Int, y: Int) -> Int {
    guard y > 1 else {
        return x
    }
    
    return x + multiply(x: x, y: y-1)
}
print(multiply(x: 5, y: 6))

// Func to get a sum of all even numbers in array

//in swift we can give functions default values
func sumOfArray(_ arr: [Int], index: Int = 0, sum: Int = 0) -> Int {
  var sum = sum
  guard index < arr.count else {
    return sum
  }

  if arr[index] % 2 == 0 {
    sum += arr[index]
  }

  return sumOfArray(arr, index: index + 1, sum: sum)

}

print(sumOfArray([3,6,1,3,2,10]))
