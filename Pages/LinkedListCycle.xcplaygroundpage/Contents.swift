import UIKit

//Linked List Cycle
//
//Given a linked list, determine if it has a cycle in it.
//
//To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.
//
//
//Input: head = [3,2,0,-4], pos = 1
//Output: true
//Explanation: There is a cycle in the linked list, where tail connects to the second node.
//
// Definition for singly-linked list.
 public class ListNode {
     public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
         self.val = val
         self.next = nil 
     }
 }

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {

        // 2 pointer one makes 1 step, another 2 steps
        var slowPointer = head
        var fastPointer = head

        while fastPointer != nil && fastPointer?.next != nil {
          slowPointer = slowPointer?.next
          fastPointer = fastPointer?.next?.next
          // "===" used instead of equatabl
          if slowPointer === fastPointer {
            return true

          }

        }
        return false
    }
}

//Middle of the Linked List(similar to Linked List Cycle)
func middleNode(_ head: ListNode?) -> ListNode? {
    var pointerOne = head
    var pointerTwo = head
    
    while pointerTwo != nil && pointerTwo?.next != nil {
        pointerOne = pointerOne?.next
        pointerTwo = pointerTwo?.next?.next
    }
    return pointerOne
}
