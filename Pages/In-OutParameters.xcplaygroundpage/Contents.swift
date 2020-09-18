//: [Previous](@previous)

import Foundation


func updateLastName(_ name: inout String) {
    let sprlitNames = name.split(separator: " ")
    let firstName = sprlitNames[0]
    print(firstName)
    
    name = "\(firstName) Appleseed" // CAN NOT MUTATE NAME UNLESS IT IS INOUT
}

var fullName = "Alex Poul"
updateLastName(&fullName)
print(fullName)
