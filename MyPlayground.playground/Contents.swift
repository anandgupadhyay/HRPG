import UIKit

//var greeting = "Hello, playground"

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


 */

//func commonChild(s1: String, s2: String) -> Int {
//    let s1Array = Array(s1)
//    let s2Array = Array(s2)
//
//    let commonChars = s1Array.filter { s2Array.contains($0) }
//
//    var maxLength = 0
//
//    for i in 0..<commonChars.count {
//        var length = 1
//        for j in i+1..<commonChars.count {
//            if s1Array.firstIndex(of: commonChars[j-1])! < s1Array.firstIndex(of: commonChars[j])! &&
//                s2Array.firstIndex(of: commonChars[j-1])! < s2Array.firstIndex(of: commonChars[j])! {
//                length += 1
//            }
//        }
//        if length > maxLength {
//            maxLength = length
//        }
//    }
//
//    return maxLength
//}
//
//var result = commonChild(s1: "ABCD", s2: "ABDC")
//print("result:\(result)")

//func commonChild(s1: String, s2: String) -> Int {
//    let l1 = s1.count
//    let l2 = s2.count
//
//    var arr = Array(repeating: Array(repeating: 0, count: l2 + 1), count: l1 + 1)
//
//    for i in (0..<l1).reversed() {
//        for j in (0..<l2).reversed() {
//            if s1[s1.index(s1.startIndex, offsetBy: i)] == s2[s2.index(s2.startIndex, offsetBy: j)] {
//                arr[i][j] = arr[i + 1][j + 1] + 1
//            } else {
//                arr[i][j] = max(arr[i + 1][j], arr[i][j + 1])
//            }
//        }
//    }
//
//    var i = 0
//    var j = 0
//    var result = ""
//
//    while i < l1 && j < l2 {
//        if s1[s1.index(s1.startIndex, offsetBy: i)] == s2[s2.index(s2.startIndex, offsetBy: j)] {
//            result.append(s1[s1.index(s1.startIndex, offsetBy: i)])
//            i += 1
//            j += 1
//        } else if arr[i + 1][j] >= arr[i][j + 1] {
//            i += 1
//        } else {
//            j += 1
//        }
//    }
//
//    return result.count
//}
//
//var result = commonChild(s1: "ABCD", s2: "ABDC")
//print("result:\(result)")

//func commonChild(s1: String, s2: String) -> Int {
//    let l1 = s1.count
//    let l2 = s2.count
//
//    var arr = [[Int]](repeating: [Int](repeating: 0, count: l2 + 1), count: l1 + 1)
//
//    let str1Array = Array(s1)
//    let str2Array = Array(s2)
//
//    for i in (0..<l1).reversed() {
//        for j in (0..<l2).reversed() {
//            if str1Array[i] == str2Array[j] {
//                arr[i][j] = arr[i+1][j+1] + 1
//            } else {
//                arr[i][j] = max(arr[i+1][j], arr[i][j+1])
//            }
//        }
//    }
//
//    var i = 0, j = 0
//    var sb = ""
//    while i < l1 && j < l2 {
//        if str1Array[i] == str2Array[j] {
//            sb.append(str1Array[i])
//            i += 1
//            j += 1
//        } else if arr[i+1][j] >= arr[i][j+1] {
//            i += 1
//        } else {
//            j += 1
//        }
//    }
//    return sb.count
//}
//
//var result = commonChild(s1: "ABCD", s2: "ABDC")
//print("result:\(result)")

//class Person{
//    var name: String
//
//    init(name:String) {
//        self.name = name
//    }
//}
//
//struct Company{
//
//    var size: Int
//    var manager: Person
//
//    init(size: Int, manager: Person){
//        self.size = size
//        self.manager = manager
//    }
//    mutating func increaseSize1(){
//        self = Company(size: size+1, manager: manager)
//    }
//
//    mutating func increaseSize2(){
//        size += 1
//    }
//}
//
//
//var companyA = Company(size: 100, manager: Person(name: "Peter"))
//print(companyA.size)
//var companyB = companyA
//
//companyA.size = 150
//print(companyA.size)


// Function definition
//func stringSimilarity(s: String) -> Int {
//    let n = s.count
//    var lcp = Array(repeating: 0, count: n)
//    var j = 0
//    for (i, char) in s.enumerated() {
//        if i == 0 {
//            continue
//        }
//        while j > 0 && s[s.index(s.startIndex, offsetBy: j)] != char {
//            j = lcp[j - 1]
//        }
//        if s[s.index(s.startIndex, offsetBy: j)] == char {
//            j += 1
//        }
//        lcp[i] = j
//    }
//    var result = n
//    for i in 1..<n {
//        result += lcp[i]
//    }
//    return result
//}
//
//// Test case 1
//let s1 = "ababaa"
//let output1 = stringSimilarity(s: s1)
//print(output1) // Output: 11
//
//// Test case 2
//let s2 = "aa"
//let output2 = stringSimilarity(s: s2)
//print(output2) // Output: 3

//func stringSimilarity1(s: String) -> Int {
//    let n = s.count
//    var lcp = Array(repeating: 0, count: n)
//    var j = 0
//    for (i, char) in s.enumerated() {
//        if i == 0 {
//            continue
//        }
//        while j > 0 && s[s.index(s.startIndex, offsetBy: j)] != char {
//            j = lcp[j - 1]
//        }
//        if s[s.index(s.startIndex, offsetBy: j)] == char {
//            j += 1
//        }
//        lcp[i] = j
//    }
//    var result = n
//    for i in 1..<n {
//        result += lcp[i]
//    }
//    return result
//}
//func maxSubarray(arr: [Int]) -> [Int] {
//    var maxSubarraySum = Int.min
//    var maxSubsequenceSum = 0
//
//    for num in arr {
//        // Update maxSubsequenceSum
//        maxSubsequenceSum = max(maxSubsequenceSum + num, maxSubsequenceSum, num)
//
//        // Update maxSubarraySum
//        maxSubarraySum = max(maxSubarraySum, maxSubsequenceSum)
//    }
//
//    return [maxSubarraySum, maxSubsequenceSum]
//}

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
    
    // populate the graph
    for edge in edges {
        let u = edge[0]-1, v = edge[1]-1
        graph[u].append(v)
        graph[v].append(u)
    }
    
    var distances = Array(repeating: -1, count: n) // array to store the distances from the starting node
    var visited = Set<Int>() // set to keep track of visited nodes
    var queue = Set<Int>([s-1]) // initialize the queue with the starting node
    
    distances[s-1] = 0 // distance to starting node is 0
    
    // perform breadth-first search
    while !queue.isEmpty {
        let u = queue.removeFirst()
        visited.insert(u)
        for v in graph[u] {
            if !visited.contains(v) { // v has not been visited yet
                distances[v] = distances[u] + 6
                queue.insert(v)
            }
        }
    }
    
    distances.remove(at: s-1) // remove the distance to the starting node
    return distances
}
