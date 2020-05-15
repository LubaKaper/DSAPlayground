import UIKit

//Implementing a Node Structure

class Node <T: Equatable>: Equatable {
    var value: T
    // pointer to the next value
    var next: Node? // singly linked list(can go only forward)
   // var previous: Node?// doubly linked list(can go back and forward)
    
    // required function with equatable
    //(lhs) tail == (rhs) head
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value  && lhs.next == rhs.next
    }
    init(_ value: T) {
        self.value = value
    }
}

// implementing CustomStringConvertable to customize description of a Node
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            // if we have only 1 node
            return "\(value) -> nil"
        }
       // if we have multiple nodes
        return "\(value) -> \(next)"
    }
}
// instantiating node onstannces
let car12 = Node<Int>(12)
let car99 = Node<Int>(99)
let car11 = Node<Int>(11)

// link our Nodes (linked using connecting nodes)
car12.next = car99
car99.next = car11
//car12.next = car11

// prinyt current state of the linked node
// to be readeble we conformed to CustomDStrungConvertable
// implement var description and wrote print logic
print(car12)
print(car99)


//implementation of Linked List

class LinkedList<T: Equatable> {
    var head: Node<T>?// nil
    var tail: Node<T>?// nil
    
    // first computed property
    public var first: Node<T>? {
        return head
    }
    
    // last computed property
    public var last: Node<T>? {
        return tail
        }
    // isEmpty computed property
    public var isEmpty: Bool{
        return head == nil
    }
    
    // append method - adds a node to the end of the list
    public func append(_ value: T) {
        // create Node:
        let newNode = Node(value)
        // scenario 1: Appending to an empty list
        guard let lastNode = tail else {
            // empty list
            head = newNode
            tail = head
            return
        }
        // scenario 2: have existig nodes
        lastNode.next = newNode
        tail = newNode
    }
    // removeLast method - removes the last node from the end of the list
    public func removeLast() -> Node<T>? {
        // scenario 1 - empty list
       if isEmpty {
            return nil
        }
        var removedNode: Node<T>?
        // scenario 2 - if have 1 element in list
        if head == tail {
            removedNode = head
            head = nil
            tail = nil
            return removedNode
        }
        // scenario 3 - iterate , triverse, walk  the linked list starting from the head
        var currentNode = head
        while currentNode?.next != tail { // stop at Node before the tail
            // keep triversing
            currentNode = currentNode?.next
        }
        // where is currentNode at the end of the while loop
        
        // save the taol's node before removing the last node (tail)
        removedNode = tail
        // st tail to Node befor ethe last one
        tail = currentNode
        currentNode?.next = nil
        
        return removedNode
    }
}

extension LinkedList: CustomStringConvertible {
    
    // stored property
    // var name = 90 - DOES NOT COMPILE, EXTENSIONS ARE NOT ALLOWED TO HAVE STORED PROPERTIES
    
    // computed property
    var description: String {
        guard let head = head else {
            return "empty list"
        }
    return "\(head)"
    }
}

let fellows = LinkedList<String>()
fellows.append("Oscar")

fellows.append("Tanya")
fellows.append("David")
fellows.removeLast()
fellows.append("Luba")
print(fellows)// Oscar -> nil


//func reverse(_ head: Node<Int>?) -> Node<Int>? {
//// Step 1
//    var current = head
//    var previous = Node<Int>?.self
//    var next = Node<Int>?.self
//
//
//  while current != nil {
//    next = current?.next
//    current?.next = previous
//    previous = current
//    current = next
//
//  }
//
//  return previous
//}

class LLNode {
  var value: Int
  var next: LLNode?
  init(_ value: Int) {
    self.value = value
  }
}

let node1 = LLNode(1)
let node2 = LLNode(2)
let node9 = LLNode(9)
let node4 = LLNode(4)
let node5 = LLNode(5)

node1.next = node2
node2.next = node9
node9.next = node4
node4.next = node5

// problem 1
// Using the Linked List above, write a function that finds the largest number in a Linked List of Ints.
// output: 9

func largestNumber(_ node: LLNode) -> Int {
  var node = node
  var largestNum = node.value

  while let next = node.next {
    if largestNum < next.value {
      largestNum = next.value
    }

    node = next
  }

  return largestNum
}


print(largestNumber(node1))

// REVERSED LINKED LIST NEEDED!!!!!

public class ListNode<Int> {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            // if we have only 1 node
            return "\(val) -> nil"
        }
        // if we have more then 1 node
        return "\(val) -> \(next)"
    }
}

func reverseList(_ head: ListNode<Int>?) -> ListNode<Int>? {
        
        var current = head
        var next: ListNode<Int>?
        var previous: ListNode<Int>?
        
        while current != nil {
            next = current?.next
            current?.next = previous
            previous = current
            current = next
            
        }
        
        return previous
    }

let num1 = ListNode(1)
let num2 = ListNode(2)
let num3 = ListNode(3)
let num4 = ListNode(4)
let num5 = ListNode(5)

num1.next = num2
num2.next = num3
num3.next = num4
num4.next = num5
print("LinkedList = \(num1)")
print("ReverseList = \(reverseList(num1)!)")
