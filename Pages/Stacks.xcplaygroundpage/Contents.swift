import Foundation

// implement a Generic Stack using an Array (of not specified type, so we can use any type)
// generic type
struct Stack<T> {
    private var elements = [T]() // works with any type(but only 1 type)
    // mutating is because it is struct
    //peek will return last element
    public var peek: T? {
        return elements.last
    }
    //
  public mutating func push(item: T) {
        elements.append(item)
    }
    // pop removes last element and returns array
    public mutating func pop() ->T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast()
    }

}
var cohorts = Stack<Double>()
    cohorts.push(item: 1.0)
cohorts.push(item: 2.0)
cohorts.push(item: 3.0)
cohorts.push(item: 4.0)
cohorts.push(item: 5.0)
cohorts.push(item: 6.0)

print(cohorts.peek)

cohorts.pop()
cohorts.pop()

print(cohorts.peek)


struct Fellow {
    let name: String
    let language: String
}

let ameni = Fellow(name: "Ameni", language: "Swift")
let tom = Fellow(name: "Tom", language: "Kotlin")

var fellows = Stack<Fellow>()
fellows.push(item: tom)
print(fellows)


class MinStack {
    init() {
        
    }
    var arrOfInts = [Int]()
    var minNum = [Int]()
    
    func push(x: Int) {
        arrOfInts.append(x)
        
        if minNum.count == 0 {
            minNum.append(x)
        } else {
            if let minNumber = minNum.last, let lastNum = arrOfInts.last {
                if lastNum <= minNumber {
                  minNum.append(lastNum)
            }
        }
    }
    
        
    }
    func pop() -> Int {
        guard !arrOfInts.isEmpty else {
           return 0
        }
        let removedNum = arrOfInts.popLast()
        if let numRemoved = removedNum, let min1 = minNum.last {
            if numRemoved == min1 {
                minNum.popLast()
            }
        }
        return arrOfInts.popLast() ?? 0
    }
    
    func top() -> Int? {
        guard !arrOfInts.isEmpty else {
           return nil
        }
           return arrOfInts.last
        
    }
    
    func getMin() -> Int? {
        return minNum.last ?? 0
    }
}

let obj = MinStack()
//
obj.push(x: -8)
obj.push(x: 10)
obj.push(x: -5)
obj.push(x: 100)

obj.top()
obj.getMin()
obj.pop()
obj.top()
obj.getMin()

// Find MIN STACK!!!!!!!!

struct MinStack2 {
    
    var stack = [Int]()
    var min_stack = [Int]()
    
    init() {
    }
    
    public mutating func push(_ x : Int){
        stack.append(x)
        if min_stack.isEmpty || x <= min_stack.last! {
            min_stack.append(x)
        }
    }
    
    public mutating func pop()->Int{
        if stack.popLast() == min_stack.last!{
            return min_stack.popLast()!
        }
        return stack.popLast()!
    }
    
    public func top()->Int{
        return stack.last!
    }
    
    public func getMin()->Int{
        return min_stack.last!
    }
}

var stack2 = MinStack2()
stack2.push(1)
stack2.push(2)
stack2.push(3)
stack2.push(0)
stack2.push(-30)
stack2.push(400)
print(stack2)
print(stack2.getMin())



// Function to find largest element in Stack

//struct Stack<T> {
//    mutating func push(_ newElement: T) {
//        arr.append(newElement)
//    }
//    mutating func pop() -> T? {
//        return arr.popLast()
//    }
//    func peek() -> T? {
//        return arr.last
//    }
//    var isEmpty: Bool {
//        return arr.count == 0
//    }
//    private var arr: [T] = []
//}
//
//func largestElement<T: Comparable>(in stack: Stack<T>) -> T? {
//    guard !stack.isEmpty else { return nil }
//    var stack = stack
//    var largestElementSoFar = stack.pop()!
//    while !stack.isEmpty {
//        let currentElement = stack.pop()!
//        if currentElement > largestElementSoFar {
//            largestElementSoFar = currentElement
//        }
//    }
//    return largestElementSoFar
//}

// Func to find sum of elements in Stack

//struct Stack<T> {
//    mutating func push(_ newElement: T) {
//        arr.append(newElement)
//    }
//    mutating func pop() -> T? {
//        return arr.popLast()
//    }
//    func peek() -> T? {
//        return arr.last
//    }
//    var isEmpty: Bool {
//        return arr.isEmpty
//    }
//    private var arr: [T] = []
//}
//
//func sumOfElements(in stack: Stack<Int>) -> Int? {
//    guard !stack.isEmpty else { return 0 }
//    var stack = stack
//    var sum = 0
//    while !stack.isEmpty {
//    let currentElement = stack.pop()!
//    sum += currentElement
//    }
//    return sum
//}
//var elements = Stack<Int>()
//elements.push(3)
//elements.push(4)
//elements.push(8)
//elements.push(1)
//elements.push(4)
//
//print(sumOfElements(in: elements) ?? 0)

var x: Int?
let y = x ?? 5
print(y)
