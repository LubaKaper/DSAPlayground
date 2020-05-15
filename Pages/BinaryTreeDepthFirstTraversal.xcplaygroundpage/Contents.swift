import UIKit

//Binary Tree Deptyh First Traversal

// Depth-first traversal
/*
 1. in-oder
 2. pre-order
 3.post-order
                1
               / \
              2   3
             / \  / \
            4   5 6  7
 */


class BinaryTreeNode<T> {
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    init(_ value: T) {
        self.value = value
    }
}
extension BinaryTreeNode {
    // in-order traversal
    // rules:
    /*
     1.visit left child recursively
     2.visit current node
     3.visit right child recursively
     
     */
    func inOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        leftChild?.inOrderTraversal(visit: visit) // recursively
        visit(self)
        rightChild?.inOrderTraversal(visit: visit) // recursively
    }
    // pre-order traversal
    // closure captures values(stores values)
    func preOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        visit(self)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
    func postOrderTraversal(visit: (BinaryTreeNode) ->()) {
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(self)
    }
}

// test in-order traversal
// create a tree
let treeNode = BinaryTreeNode<Int>(1)
let twoNode = BinaryTreeNode<Int>(2)
let threeNode = BinaryTreeNode<Int>(3)
let fourNode = BinaryTreeNode<Int>(4)
let fiveNode = BinaryTreeNode<Int>(5)
let sixNode = BinaryTreeNode<Int>(6)
let fsevenNode = BinaryTreeNode<Int>(7)

treeNode.leftChild = twoNode
treeNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode
threeNode.leftChild = sixNode
threeNode.rightChild = fsevenNode

// test in-order traversal
// expected output: 4,2,5,1,6, 3, 7
print("in-order traversal: ")
treeNode.inOrderTraversal { (node) in
    print(node.value, terminator: " ")
}

print("\n")

// test pre-order traversal
print("pre-order traversal")
treeNode.preOrderTraversal { (node) in
    print(node.value, terminator: " ") // 1 2 4 5 3 6 7
}
print("\n")

// test post-order traversal
print("post-order traversal")
treeNode.postOrderTraversal { (node) in
    print(node.value, terminator: " ") // 4 5 2 6 7 3 1
}
print("\n")

// Encyclopedia, Science, Culture, Art and Craft
/*
 
              Encyclopedia
                   / \
          Science     Culture
                        /  \
                    Art     Craft
*/

let treeNode2 = BinaryTreeNode<String>("Encyclopedia")
let twoNode2 = BinaryTreeNode<String>("Science")
let threeNode2 = BinaryTreeNode<String>("Culture")
let fourNode2 = BinaryTreeNode<String>("Art")
let fiveNode2 = BinaryTreeNode<String>("Craft")

treeNode2.leftChild = twoNode2
treeNode2.rightChild = threeNode2
threeNode2.leftChild = fourNode2
threeNode2.rightChild = fiveNode2

treeNode2.preOrderTraversal { (node) in
    print(node.value, terminator: " ") //Encyclopedia, Science, Culture, Art, Craft
}


//func maxDepth(_ root: Node<Int>?) -> Int {
//  guard let root = root else {
//    return 0
//  }
//
//  let leftDepth = maxDepth(root.leftNode)
//  let rightDepth = maxDepth(root.rightNode)
//  
//  if leftDepth > rightDepth {
//    return leftDepth + 1
//  } else {
//    return rightDepth + 1
//  }
//}

//class Solution {
//    func maxDepth(_ root: TreeNode?) -> Int {
//
//        guard let root = root else {return 0}
//        // base case
//        if root.left == nil && root.right == nil {
//          return 1
//        }
//        let leftSide = maxDepth(root.left) + 1 // 3 9 (1 + 1)
//        let rightSide = maxDepth(root.right) + 1 // (1 + 1 + 1)
//
//
//        return max(leftSide, rightSide)
//    }
//}

