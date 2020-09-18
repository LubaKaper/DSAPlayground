//: [Previous](@previous)

import Foundation


func lemonadeChange(change: [Int]) -> Bool {
    
    var fives = 0
    var tens = 0
    
    for bill in change {
    switch bill {
    case 5:
        fives += 1
    case 10:
        fives -= 1
        tens += 1
    case 20:
        if tens > 0 {
        fives -= 1
        tens -= 1
        } else {
            fives -= 3
        }
    default:
        return false
    }
        guard fives >= 0 else {
            return false
        }
    }
    
    return true
}

print(lemonadeChange(change: [5,10,5,10,20]))
