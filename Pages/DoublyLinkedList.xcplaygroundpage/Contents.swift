//: [Previous](@previous)

import Foundation

// singly LinkedList difference is there are no weak variebles

//class SLNode {
//    var next: SLNode?
//   var previous: SLNode?
//    var value: Int
//    init(_ value: Int) {
//        self.value = value
//    }
//}


// Doubly LinkedList
class DLNode {
    var next: DLNode?
    weak var previous: DLNode?
    var value: Int
    init(_ value: Int) {
        self.value = value
    }
}
