//: [Previous](@previous)

import Foundation


//variadic sintax:  DataType...
func networkingList(_ friends: String...) {
    guard !friends.isEmpty else {
        print("Lets do some more Networking")
        return
    }
    for friend in friends {
        print("\(friend) is now a friend")
    }
}
networkingList() //
networkingList("Greg")
networkingList("Chelsi", "Luba")
