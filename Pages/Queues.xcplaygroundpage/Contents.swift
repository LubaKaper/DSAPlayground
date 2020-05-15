import UIKit
//REVIEW: customstringconvertable
//Queues: is a abstract data type that is a FIFO structure (meqning: first object added is the first object to be removed from the data structure)
//methods of a Queue: FIRST IN FIRST OUT!
//enqueue: add item to the back of the queue
//dequeue: remove item from the front of the queue
//properties: count, isEmpty, peek
struct Queue<T> {
    // implementing a queue using an array
    private var elements = [T]()
    // private var linkedList = LinkedList<T>()
    // private var stack = [Int]()
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    public var count: Int {
        return elements.count
    }
    //returns the item in the front of the queue, does not remove it
    public var peek: T? {
        return elements.first
    }
    //add item to elements
    public mutating func enqueue(_ item: T) {
        elements.append(item)
    }
    //remove item from front of elements array
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
}
var queue = Queue<String>()
queue.enqueue("Mel")
queue.enqueue("Kelby")
queue.enqueue("Oscar")
print("\(queue.peek ?? "") is at the front of the line")
queue.dequeue()
print("fellows left in the are \(queue)")
queue.enqueue("Eric")
print("there are \(queue.count) fellows on line")
//Iterate through a queue structure
var queueCopy = queue
print("there are \(queueCopy.count) fellows in queueCopy")
while let value = queueCopy.dequeue() {
    print("fellow: \(value)")
}
print("There are \(queueCopy.count) fellows left in queueCopy")
//PRACTICE:
//1. Find the smallest element in a queue
//func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
//    return nil
//}
func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    var smallestQueue = q
    guard var smallest = smallestQueue.peek else { return nil }
    while let value = smallestQueue.dequeue() {
        if value <= smallest {
            smallest = value
        }
    }
    return smallest
}
var queue2 = Queue<Int>()
queue2.enqueue(1)
queue2.enqueue(-5)
queue2.enqueue(100)
smallestElement(in: queue2)
//2. Find the sum of a queue of Ints
//func sum(of q: Queue<Int>) -> Int {
//    return 0
//}
func sum(of q: Queue<Int>) -> Int {
    var someQueue = q
    var sumNum = Int()
    while let value = someQueue.dequeue() {
        sumNum = sumNum + value
    }
    return sumNum
}
var queue3 = Queue<Int>()
queue3.enqueue(1)
queue3.enqueue(-5)
queue3.enqueue(100)
sum(of: queue3)


// Question 4
//queueRange
//Write a function range() that takes in a Queue of numbers, returns the range (difference between the minimum and maximum).

//Input:
// BACK 4 2 9 6 5 FRONT
//
// Output:
// 7
// Explanation: The max is 9, the min is 2, and their difference is 7



//public struct Queue<T> {
//    private var array = [T?]()
//    private var head = 0
//    
//    public var isEmpty: Bool {
//        return count == 0
//    }
//    
//    public var count: Int {
//        return array.count - head
//    }
//    public var peek: T? {
//        return array.first as? T
//    }
//    
//    public mutating func enqueue(_ element: T) {
//        array.append(element)
//    }
//    
//    public mutating func dequeue() -> T? {
//        guard let element = array[guarded: head] else { return nil }
//        array[head] = nil
//        head += 1
//        let percentage = Double(head)/Double(array.count)
//        if array.count > 50 && percentage > 0.25 {
//            array.removeFirst(head)
//            head = 0
//        }
//        return element
//    }
//    public var front: T? {
//        if isEmpty {
//            return nil
//        } else {
//            return array[head]
//        }
//    }
//}
//
//extension Array {
//    subscript(guarded idx: Int) -> Element? {
//        guard (startIndex..<endIndex).contains(idx) else {
//            return nil
//        }
//        return self[idx]
//    }
//}
//
//
//func range(in queue: Queue<Int>) -> Int? {
//    var smallestQueue = queue
//    
//    guard var smallest = smallestQueue.peek else { return nil}
//    while let value = smallestQueue.dequeue() {
//        if value <= smallest {
//            smallest = value
//        }
//    }
//    var largestQueue = queue
//    guard var largest = largestQueue.peek else { return nil}
//    while let value2 = largestQueue.dequeue() {
//        if value2 >= largest {
//            largest = value2
//        }
//    }
//    let myrange = largest - smallest
//    return myrange
//}
//var queOfNums = Queue<Int>()
//queOfNums.enqueue(4)
//queOfNums.enqueue(2)
//queOfNums.enqueue(9)
//queOfNums.enqueue(6)
//queOfNums.enqueue(5)
//
//print(range(in: queOfNums) ?? 0)
//print(queOfNums)

