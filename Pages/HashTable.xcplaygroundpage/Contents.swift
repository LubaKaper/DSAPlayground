//: [Previous](@previous)

import UIKit

//
 
var buckets = Array(repeating: 0, count: 2)

// hasjvalue is built-in hash function
// returns a hash value for a key
// its possible to get negative number
// how can we fix this - take the absolute value of the operation
// abs gives positive value
let alexIndex = abs("Alex".hashValue % buckets.count)
let brendonIndex = abs("Brendon".hashValue % buckets.count)
let ahadIndex = abs("Ahad".hashValue % buckets.count)
let tanyaIndex = abs("Tanya".hashValue % buckets.count)
print("goes in \(alexIndex) index")
print("goes in \(brendonIndex) index")
print("goes in \(ahadIndex) index")
print("goes in \(tanyaIndex) index")

var dict = [String: Int]()
dict["Sweden"] = 1
print(buckets)

// Implement Hash Table

// e.g HashTable<String: Int> (capacity: 4)

struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    
    private typealias Bucket = [Element]
    
    private var buckets: [Bucket]
    
    private (set) var count = 0 // getter is public, setter is public
    
    init(capacity: Int) {
        buckets = Array<Bucket>(repeating: [], count: capacity)
        // e g buckets = [[], [], [(key: "Tiffany": 21)], []]
    }
    // methof to return index where key will be stored
    func index(forKey key: Key) -> Int {
        let index = abs(key.hashValue % buckets.count)
        return index
    }
    
    // method to search for a value given a key
    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    // method to update value for a given key
    mutating func update(value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                // update current value
                buckets[index][i].value = value
                return oldValue
            }
        }
        // we get here if there is no value
        buckets[index].append((key: key, value: value))
        count += 1
        return nil // to signify there wasnt a value
    }
    
    // method to remove an element at a given key
    mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil
    }
    
    // we can have multiple subscript methods
    subscript(key: Key) -> Value? {
        get {
            return(value(forKey: key))
        } set {
            if let value = newValue {
                update(value: value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
}

// test hash table

// key is string and the value in an Int and capacity is 4
var hashTable = HashTable<String, Int>(capacity: 4)

hashTable["Tiffany"] = 21 // same as below
//hashTable.update(value: 21, forKey: "Tiffany")
hashTable.update(value: 25, forKey: "Eric")

print(hashTable.count)
print(hashTable)
//hashTable.removeValue(forKey: "Tiffany")
hashTable["Tiffany"] = nil
print(hashTable.count)
print(hashTable)

print(hashTable.value(forKey: "Eric") ?? 0)

if let name = hashTable["Alex"] {
    print("\(name) exist")
} else {
    print("does not exist")
}
let age = hashTable["Cameron"] ?? 100
print(age)

//func firstUniqChar(_ s: String) -> Int {
//    
//    for (i, element) in s.enumerated() {
//        for (j, element) in s.enumerated() {
//            if s[i] != s[j] {
//                return i
//            }
//        }
//    }
//    return -1
//}
