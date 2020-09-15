//: [Previous](@previous)

import Foundation

//You are given an array of strings words and a string chars.
// A string is good if it can be formed by characters from chars (each character can only be used once).
// Return the sum of lengths of all good strings in words.
/*
Input: words = ["cat","bt","hat","tree"], chars = "atach"
Output: 6
Explanation:
The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.
*/
/*
Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
Output: 10
Explanation:
The strings that can be formed are "hello" and "world" so the answer is 5 + 5 = 10.
*/
// at least one word in the array
// at least one character in each word
// chars has at least one character inside the string
// we're gonna do a for loop, " for word in words"
// "for char in word"
// runtime is O(n^2)
// use a frequency dictionary
// runtime O(n)
// guard word <= chars.count
func countCharacters(_ words: [String], _ chars: String) -> Int {
  var charsDict = [Character: Int]()
  var sum = 0
  // "a", charsDict["a"] = 3
  for char in chars {
    charsDict[char] = (charsDict[char] ?? 0) + 1
  }
  Outerloop: for word in words {
    guard word.count <= chars.count else {
      continue
    }
    // "caaa" , chars "cata"
    // a 2 times, "cat"
    // a 1 time, "ct"
    // no more as left, its a bad word
    // dictionary ["c" : 1, "a" : 2, "t" : 1]
    // charsDict["a"] = 2 - 1
    // charsDict["a"] = 1 - 1
    // line 103, sets to nil
    // dictionary ["c": 1, "t" : 1]
    // everytime we see a character being used, we're minusing one in the dictionary
    var charsDict = charsDict
    // we're making a copy of charsDict to modify
    for letter in word {
      if charsDict.keys.contains(letter) {
        charsDict[letter] = (charsDict[letter] ?? 0) - 1
        if charsDict[letter] == 0 {
          charsDict[letter] = nil
        }
      } else {
        continue Outerloop
      }
    }
    sum += word.count
  }
  return sum
}
print(countCharacters(["cat","bt","hat","tree"], "atach"))
// "catar", "catr"
// guard statement
// guard word.count > chars.count
// "Make sure this goes through or else continue happens"
// guard 5 > 4
// example word: "catar",  chars: "catr"
// c in word, chars: "atr"
// a in word, chars: "tr"
// t in word, chars: "r"
// not a valid string, too many as.
// Dictionaries in swift, are key value pairs
// dictionary(Character:Int)
// dictionary["a"] = 1
// dictionary.remove()
// dictionary["a"] = nil
// dictionary()

//===============================================================
// Polindrome
let str = "racecare"
func isPolindrome(str: String) -> Bool {
    var newStr = ""
    for char in str {
        newStr = String(char) + newStr// r + "", a + r, c+ar, e + car, c + ecar, a + cecar, r + acecar, e + racecar
        print(char)
        print(newStr)
    }
    if newStr == str {
        return true
    }
//    } else {
//        return false
//    }
    return false
}
print(isPolindrome(str: str))
