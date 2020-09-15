//: [Previous](@previous)

import Foundation

//Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
//
//Each letter in the magazine string can only be used once in your ransom note.
//
//Example 1:
//
//Input: ransomNote = "a", magazine = "b"
//Output: false
//Example 2:
//
//Input: ransomNote = "aa", magazine = "ab"
//Output: false
//Example 3:
//
//Input: ransomNote = "aa", magazine = "aab"
//Output: true

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    
    var ransomDict = [Character: Int]()
    var magDict = [Character: Int]()
//    for char in ransomNote {
//        ransomDict[char] = (ransomDict[char] ?? 0) + 1
//    }
    for char in magazine {
        magDict[char] = (magDict[char] ?? 0) + 1
    }
    for char in ransomNote {
        ransomDict[char] = (ransomDict[char] ?? 0) + 1
        if ransomDict[char] ?? 0 > magDict[char] ?? 0 {
            return false
        }
    }
    return true
}
print(canConstruct("aa", "aab"))
// this missing a condition that each letter can only be used once
