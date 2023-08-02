import UIKit
import Foundation


let array1 = [1, 2, 3, 4, 5]
let array2 = ["One", "Two", "Three", "Four", "Five"]

func createDictionary(array1: [Int], array2: [String]) -> [Int: String] {
    let combinedArray = Array(zip(array1, array2))
    let array3 = combinedArray.reduce(into: [Int: String]()) { result, tuple in
        let (key, value) = tuple
        result[key] = value
    }
    return array3
}

let array3 = createDictionary(array1: array1, array2: array2)
print(array3)

//Thread safe Singleton class
//You are able to implement Swift's Singleton pattern for concurrent envirompment using GCD and 3 main things:

// Custom concurrent queue - local queue for better performance where multiple reads can be happened at the same time
// sync - customQueue.sync for reading a shared resource - to have clear API without callbacks
// barrier flag - customQueue.async(flags: .barrier) for writing operation: wait when running operations are done -> execute write task -> proceed executing task

public class MySingleton {
    public static let shared = Singleton()
    
    //1. custom queue
    private let customQueue = DispatchQueue(label: "com.mysingleton.queue", qos: .default, attributes: .concurrent)
    //shared resource
    private var sharedResource: String = "Hello World"

    //computed property can be replaced getters/setters
    var computedProperty: String {
        get {
            //2. sync read
            return customQueue.sync {
                sharedResource
            }
        }
        set {
            //3. async write
            customQueue.async(flags: .barrier) {
                sharedResource = newValue
            }
        }
    }
    
    private init() {
    }
}


//var greeting = "Hello, playground"

//Hacker rank  Counter game Louce vs Richard power of 2 game
// func isPowerOfTwo(_ num: Int) -> Bool {
//     return (num > 0) && (num & (num - 1) == 0)
// }

// func nextPowerOfTwo(_ num: Int) -> Int {
//     var powerOfTwo = 1
//     while powerOfTwo <= num {
//         powerOfTwo *= 2
//     }
//     return powerOfTwo / 2
// }

// func whoWinsTheGame(_ n: Int) -> String {
//     if n == 1 {
//         return "Richard"
//     }

//     var currentValue = n
//     var isLouiseTurn = true

//     while currentValue > 1 {
//         if isLouiseTurn {
//             if isPowerOfTwo(currentValue) {
//                 currentValue /= 2
//             } else {
//                 let reduceBy = nextPowerOfTwo(currentValue)
//                 currentValue -= reduceBy
//             }
//         } else {
//             if isPowerOfTwo(currentValue) {
//                 return "Louise"
//             } else {
//                 let reduceBy = nextPowerOfTwo(currentValue)
//                 currentValue -= reduceBy
//             }
//         }

//         isLouiseTurn = !isLouiseTurn
//     }

//     return isLouiseTurn ? "Louise" : "Richard"
// }

// // Example usage:
// let n = 6
// let winner = whoWinsTheGame(n)
// print(winner) // Output: Richard


//MVVM Demo
//Model
// struct User {
//     let name: String
//     let age: Int
// }
// import SwiftUI

// //View 
// struct UserView: View {
//     @ObservedObject var viewModel: UserViewModel
    
//     var body: some View {
//         VStack {
//             Text("Name: \(viewModel.name)")
//             Text("Age: \(viewModel.age)")
            
//             Button("Update Age") {
//                 viewModel.updateAge()
//             }
//         }
//     }
// }

// //View Model
// import SwiftUI
// class UserViewModel: ObservableObject {
//     @Published var name: String
//     @Published var age: Int
    
//     init(user: User) {
//         self.name = user.name
//         self.age = user.age
//     }
    
//     func updateAge() {
//         age += 1
//     }
// }

//===========================================

//func findSearchKeyIndex(arrayOfWords: [String], searchKey: String) -> Int {
//    let keyWords = searchKey.components(separatedBy: " ")
//    var lastIndex = -1
//
//    for i in 0...(arrayOfWords.count - keyWords.count) {
//        if arrayOfWords[i] == keyWords[0] {
//            var found = true
//
//            for j in 1..<keyWords.count {
//                if arrayOfWords[i+j] != keyWords[j] {
//                    found = false
//                    break
//                }
//            }
//
//            if found {
//                lastIndex = i
//            }
//        }
//    }
//
//    return lastIndex
//}
//
//let arrayOfWords = ["Today", "My", "My", "Name", "is", "Anand"]
//let arrayOfWords1 = ["Today", "My","Name", "My", "Name", "is", "Anand"]
//let arrayOfWords2 = ["Today", "My", "Your", "My", "Your", "is", "Anand"]
//let searchKey = "My Name"
//
//let index = findSearchKeyIndex(arrayOfWords: arrayOfWords, searchKey: searchKey)
//print("Index:\(index)")
//let index1 = findSearchKeyIndex(arrayOfWords: arrayOfWords1, searchKey: searchKey)
//print("Index:\(index1)")
//let index2 = findSearchKeyIndex(arrayOfWords: arrayOfWords2, searchKey: searchKey)
//print("Index:\(index2)")

func generateRandomWord() -> String {
    let length = Int(arc4random_uniform(10)) + 1 // Random length between 1 and 10
    var word = ""
    for _ in 0..<length {
        let randomChar = Character(UnicodeScalar(arc4random_uniform(26) + 97)!) // Random lowercase letter from 'a' to 'z'
        word.append(randomChar)
    }
    return word
}

var randomWords: [String] = []
for _ in 0..<100 {
    let randomWord = generateRandomWord()
    randomWords.append(randomWord)
}

print(randomWords)









/*
//Write a function in swift  to find elements that repeat a given N times in a given L list.
let array = [1,2,3,3,4,4,5,5,2,3,1,4,0,3,2,1,3,4,5,2,7,3,3]
let occurance = 1
let countDict = Dictionary(grouping: array, by: { $0 })
print(countDict)
let answer = countDict.filter { $0.value.count == occurance }.map { $0.key }
print(answer.sorted()) // Solution 1

//solution 2
let histogram2 = array.reduce(into: [:]) { count,number in return count[number,default: 0]+=1}
print(histogram2)
let result = histogram2.filter { $0.value == occurance }.map { $0.key }
print(result.sorted())
*/

//Histogram from  [4: [4, 4, 4, 4], 0: [0], 3: [3, 3, 3, 3, 3, 3, 3], 5: [5, 5, 5], 7: [7], 2: [2, 2, 2, 2], 1: [1, 1, 1]]
//let histogram = countDict.map { key, value in return [ key : value.count] }
//print(histogram)
//let result = histogram.filter{ dict in dict.values.contains(occurance) }
//print(result.flatMap{ $0.keys })






/*
 Write function in swift
 func commonChild(s1: String, s2: String) -> Int {
 }

 A string is said to be a child of a another string if it can be formed by deleting 0 or more characters from the other string. Letters cannot be rearranged. Given two strings of equal length, what's the longest string that can be constructed such that it is a child of both?

 Case 1
 s1 = ABCD
 s2 = ABDC
 output  = 3
 These strings have two children with maximum length 3, ABC and ABD. They can be formed by eliminating either the D or C from both strings. Return 3.

 Case 2
 s1 = HARRY
 s2 = SALLY
 output = 2
 Explaination : The longest string that can be formed by deleting zero or more characters from HARRY and  SALLY is AY , whose length is 2.

 case 3:
 s1 = AA
 s2 = BB
 output = 0
 AA and BB  have no characters in common and hence the output is 0.


 

func commonChild(s1: String, s2: String) -> Int {
    let s1Array = Array(s1)
    let s2Array = Array(s2)

    let commonChars = s1Array.filter { s2Array.contains($0) }

    var maxLength = 0

    for i in 0..<commonChars.count {
        var length = 1
        for j in i+1..<commonChars.count {
            if s1Array.firstIndex(of: commonChars[j-1])! < s1Array.firstIndex(of: commonChars[j])! &&
                s2Array.firstIndex(of: commonChars[j-1])! < s2Array.firstIndex(of: commonChars[j])! {
                length += 1
            }
        }
        if length > maxLength {
            maxLength = length
        }
    }

    return maxLength
}

var result = commonChild(s1: "ABCD", s2: "ABDC")
print("result:\(result)")

func commonChild(s1: String, s2: String) -> Int {
    let l1 = s1.count
    let l2 = s2.count

    var arr = Array(repeating: Array(repeating: 0, count: l2 + 1), count: l1 + 1)

    for i in (0..<l1).reversed() {
        for j in (0..<l2).reversed() {
            if s1[s1.index(s1.startIndex, offsetBy: i)] == s2[s2.index(s2.startIndex, offsetBy: j)] {
                arr[i][j] = arr[i + 1][j + 1] + 1
            } else {
                arr[i][j] = max(arr[i + 1][j], arr[i][j + 1])
            }
        }
    }

    var i = 0
    var j = 0
    var result = ""

    while i < l1 && j < l2 {
        if s1[s1.index(s1.startIndex, offsetBy: i)] == s2[s2.index(s2.startIndex, offsetBy: j)] {
            result.append(s1[s1.index(s1.startIndex, offsetBy: i)])
            i += 1
            j += 1
        } else if arr[i + 1][j] >= arr[i][j + 1] {
            i += 1
        } else {
            j += 1
        }
    }

    return result.count
}

var result = commonChild(s1: "ABCD", s2: "ABDC")
print("result:\(result)")

func commonChild(s1: String, s2: String) -> Int {
    let l1 = s1.count
    let l2 = s2.count

    var arr = [[Int]](repeating: [Int](repeating: 0, count: l2 + 1), count: l1 + 1)

    let str1Array = Array(s1)
    let str2Array = Array(s2)

    for i in (0..<l1).reversed() {
        for j in (0..<l2).reversed() {
            if str1Array[i] == str2Array[j] {
                arr[i][j] = arr[i+1][j+1] + 1
            } else {
                arr[i][j] = max(arr[i+1][j], arr[i][j+1])
            }
        }
    }

    var i = 0, j = 0
    var sb = ""
    while i < l1 && j < l2 {
        if str1Array[i] == str2Array[j] {
            sb.append(str1Array[i])
            i += 1
            j += 1
        } else if arr[i+1][j] >= arr[i][j+1] {
            i += 1
        } else {
            j += 1
        }
    }
    return sb.count
}

var result = commonChild(s1: "ABCD", s2: "ABDC")
print("result:\(result)")

class Person{
    var name: String

    init(name:String) {
        self.name = name
    }
}

struct Company{

    var size: Int
    var manager: Person

    init(size: Int, manager: Person){
        self.size = size
        self.manager = manager
    }
    mutating func increaseSize1(){
        self = Company(size: size+1, manager: manager)
    }

    mutating func increaseSize2(){
        size += 1
    }
}


var companyA = Company(size: 100, manager: Person(name: "Peter"))
print(companyA.size)
var companyB = companyA

companyA.size = 150
print(companyA.size)


 Function definition
func stringSimilarity(s: String) -> Int {
    let n = s.count
    var lcp = Array(repeating: 0, count: n)
    var j = 0
    for (i, char) in s.enumerated() {
        if i == 0 {
            continue
        }
        while j > 0 && s[s.index(s.startIndex, offsetBy: j)] != char {
            j = lcp[j - 1]
        }
        if s[s.index(s.startIndex, offsetBy: j)] == char {
            j += 1
        }
        lcp[i] = j
    }
    var result = n
    for i in 1..<n {
        result += lcp[i]
    }
    return result
}

// Test case 1
let s1 = "ababaa"
let output1 = stringSimilarity(s: s1)
print(output1) // Output: 11

// Test case 2
let s2 = "aa"
let output2 = stringSimilarity(s: s2)
print(output2) // Output: 3

func stringSimilarity1(s: String) -> Int {
    let n = s.count
    var lcp = Array(repeating: 0, count: n)
    var j = 0
    for (i, char) in s.enumerated() {
        if i == 0 {
            continue
        }
        while j > 0 && s[s.index(s.startIndex, offsetBy: j)] != char {
            j = lcp[j - 1]
        }
        if s[s.index(s.startIndex, offsetBy: j)] == char {
            j += 1
        }
        lcp[i] = j
    }
    var result = n
    for i in 1..<n {
        result += lcp[i]
    }
    return result
}
func maxSubarray(arr: [Int]) -> [Int] {
    var maxSubarraySum = Int.min
    var maxSubsequenceSum = 0

    for num in arr {
        // Update maxSubsequenceSum
        maxSubsequenceSum = max(maxSubsequenceSum + num, maxSubsequenceSum, num)

        // Update maxSubarraySum
        maxSubarraySum = max(maxSubarraySum, maxSubsequenceSum)
    }

    return [maxSubarraySum, maxSubsequenceSum]
}

func maxSubarray(arr: [Int]) -> [Int] {
    var maxSubarraySum = arr[0]
    var maxSubsequenceSum = arr[0]
    
    for i in 1..<arr.count {
        // Update maxSubsequenceSum
        maxSubsequenceSum = max(maxSubsequenceSum + arr[i], maxSubsequenceSum, arr[i])
        
        // Update maxSubarraySum
        maxSubarraySum = max(maxSubarraySum, maxSubsequenceSum)
    }
    
    return [maxSubarraySum, maxSubsequenceSum]
}

func maxSubarray1(arr: [Int]) -> [Int] {
    var maxSubarraySum = arr[0]
    var maxSubsequenceSum = arr[0]
    var currMax = arr[0]
    
    for i in 1..<arr.count {
        currMax = max(currMax + arr[i], arr[i])
        maxSubarraySum = max(maxSubarraySum, currMax)
        maxSubsequenceSum += max(arr[i], 0)
    }
    
    return [maxSubarraySum, maxSubsequenceSum]
}

func maxSubarray3(_ A: [Int]) -> [Int] {
    var positiveSum = 0
    var largestNum = A[0]
    var maxEndingHere = A[0]
    var maxSoFar = A[0]
    
    for i in 1..<A.count {
        let x = A[i]
        maxEndingHere = max(x, maxEndingHere + x)
        maxSoFar = max(maxSoFar, maxEndingHere)

        if x > largestNum {
            largestNum = x
        }
        if x > 0 {
            positiveSum += x
        }
    }
    
    let nonContingentSum = largestNum < 0 ? largestNum : positiveSum
    return [maxSoFar, nonContingentSum]
}

/*
 Breadth First Search: Shortest Reach in Swift Hacker rank solution
 func bfs(n: Int, m: Int, edges: [[Int]], s: Int) -> [Int] {
     // Write your code here

 }
 */
func bfs(n: Int, m: Int, edges: [[Int]], s: Int) -> [Int] {
    var graph = [Int: [Int]]() // adjacency list representation of the graph

    // populate the graph
    for edge in edges {
        let u = edge[0], v = edge[1]
        graph[u, default: []].append(v)
        graph[v, default: []].append(u)
    }

    var distances = Array(repeating: -1, count: n) // array to store the distances from the starting node
    var queue = [s] // initialize the queue with the starting node
    distances[s-1] = 0 // distance to starting node is 0

    // perform breadth-first search
    while !queue.isEmpty {
        let u = queue.removeFirst()
        for v in graph[u, default: []] {
            if distances[v-1] == -1 { // v has not been visited yet
                distances[v-1] = distances[u-1] + 6
                queue.append(v)
            }
        }
    }

    distances.remove(at: s-1) // remove the distance to the starting node
    return distances
}

func bfs1(n: Int, m: Int, edges: [[Int]], s: Int) -> [Int] {
    var graph = [[Int]](repeating: [], count: n) // adjacency list representation of the graph

//    // populate the graph
//    for edge in edges {
//        let u = edge[0]-1, v = edge[1]-1
//        graph[u].append(v)
//        graph[v].append(u)
//    }
//
//    var distances = Array(repeating: -1, count: n) // array to store the distances from the starting node
//    var visited = Set<Int>() // set to keep track of visited nodes
//    var queue = Set<Int>([s-1]) // initialize the queue with the starting node
//
//    distances[s-1] = 0 // distance to starting node is 0
//
//    // perform breadth-first search
//    while !queue.isEmpty {
//        let u = queue.removeFirst()
//        visited.insert(u)
//        for v in graph[u] {
//            if !visited.contains(v) { // v has not been visited yet
//                distances[v] = distances[u] + 6
//                queue.insert(v)
//            }
//        }
//    }
//
//    distances.remove(at: s-1) // remove the distance to the starting node
//    return distances
//}
 

//Dictionary implementation in Swift

// Implementation
class MyHashMap {

    struct Element {
        var key: Int
        var value: Int
    }

    var buckets : [Element] = []

    /** Initialize your data structure here. */
    init() {
        buckets = Array(repeating: Element(key: -1, value: -1), count: 2)
    }

    // returns the current load factor as a decimal - 1 is full, 0 is empty
    var currentLoadFactor: Double {
        return Double(buckets.compactMap{$0}.filter{$0.key == -1}.count) / Double(buckets.count)
    }

    private func resize() {
        if currentLoadFactor > 0.9 {
            // double the capacity
            let extraBuckets: [Element] = Array(repeating: Element(key: -1, value: -1), count: buckets.count)
            buckets += extraBuckets
        } else {
            if currentLoadFactor < 0.4 {
                // remove blank buckets
                buckets.removeAll(where: { $0.key == -1 })
                resize()
            }
        }
    }

    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        remove(key)
        resize()
        buckets.append(Element(key: key, value: value))
    }

    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        return buckets.first{ $0.key == key }?.value ?? -1
    }

    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        buckets.removeAll(where: { $0.key == key })
    }
}


Given an array of integers and a target value, determine the number of pairs of array elements that have a difference equal to the target value
Write function in Swift
func pairs(k: Int, arr: [Int]) -> Int {
    // Write your code here

}
 
Example :
arr = [1, 5, 3, 4, 2]
k = 2
output = 3
 */

//func pairs(k: Int, arr: [Int]) -> Int {
//    // Write your code here
//var count = 0
//    let numSet = Set(arr)
//
//    for num in arr {
//        if numSet.contains(num + k) {
//            count += 1
//        }
//    }
//
//    return count
//}


//let users = ["john": 23, "james": 24, "vincent": 34, "louis": 29]
//let sortedUsers = users.sorted(by: <)
//let sortedKeys = sortedUsers.map{$0.0}
//print(sortedKeys)




//let x = d.map{
//    $0.1 < $1.1
//}

//let x = d.sort{ $0.1 < $1.1 }.map{ $0.0 }
//print(x)

//struct IntStack {
//  var items = [Int]()
//  mutating func add(x: Int) {
//    items.append(x)
//  }
//}

//var a = 10
//var b = 5
//a = a+b
//b = a-b
//a = a-b
//print(a,b)
//
//class Master {
//    lazy var detail: Detail = Detail(master: self)
//
//    init() {
//        print("Master init")
//    }
//
//    deinit {
//        print("Master deinit")
//    }
//}
//
//class Detail {
//    var master: Master
//
//    init(master: Master) {
//        print("Detail init")
//        self.master = master
//    }
//
//    deinit {
//        print("Detail deinit")
//    }
//}
//
//func createMaster() {
//    let master: Master = Master()
//    let detail = master.detail
//}
//
//createMaster()


//extension Data {
//    enum HexadecimalConversionError: String, Error, CustomStringConvertible {
//        case incomplete_hexadecimal_string
//        case none_hexadecimal_charactor
//        var description: String {
//            return self.rawValue.replacingOccurrences(of: "_", with: " ").capitalized
//        }
//    }
//    init(hexadecimalString string: String) throws {
//        let hexadecimalString = (string.hasPrefix("0x") || string.hasPrefix("0X")) ? String(string.dropFirst(2)) : string
//        let characters = Array(hexadecimalString)
//        guard characters.count % 2 == 0 else { throw HexadecimalConversionError.incomplete_hexadecimal_string }
//        let indices = stride(from: 0, to: characters.count, by: 2)
//        let bytes = indices.map { String([characters[$0], characters[$0 + 1]]) }.map { UInt8($0, radix: 16) }
//        guard bytes.filter({ $0 == nil }).count == 0 else { throw HexadecimalConversionError.none_hexadecimal_charactor }
//        self = Data(bytes.compactMap { $0 })
//    }
//    func hexadecimalString(prefix: String? = nil) -> String {
//        let hexadecimalString = self.map { String(format: "%02hhx", $0) }.joined()
//        return (prefix ?? "") + hexadecimalString
//    }
//    var hexadecimalString: String {
//        return hexadecimalString()
//    }
//}
//
////Usage
//do {
//    let string = "0x48656c6c6f20576f726C64"
//    let data = try Data(hexadecimalString: string)
//    print(data.hexadecimalString(prefix: "0x"))
//}
//catch {
//    print("\(error)")
//}

//Stock max Hacker rank Swift Solution
//func stockmax(prices: [Int]) -> Int {
//    // Write your code here
//    let n = prices.count
//    var dp = [Int](repeating: 0, count: n)
//    var max = prices[n - 1]
//
//for i in stride(from: n - 1, through: 0, by: -1) {
//    max = (prices[i] > max) ? prices[i] : max
//    dp[i] = max
//}
//
//var sum: Int = 0
//
//for i in 0..<n {
//    sum += Int(dp[i] - prices[i])
//}
//    return sum
//}

