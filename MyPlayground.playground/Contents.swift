import UIKit

var greeting = "Hello, playground"

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

func commonChild1(s1: String, s2: String) -> Int {
    let s1Array = Array(s1)
    let s2Array = Array(s2)
    
    let commonChars = s1Array.filter { s2Array.contains($0) }
    
    var maxLength = 0
    
    for i in 0..<commonChars.count {
        var length = 1
        let commonChar = commonChars[i]
        let s1Indices = s1Array.indices.filter { s1Array[$0] == commonChar }
        let s2Indices = s2Array.indices.filter { s2Array[$0] == commonChar }
        var j = 0
        var k = 0
        while j < s1Indices.count && k < s2Indices.count {
            if s1Indices[j] < s1Indices.first! || s2Indices[k] < s2Indices.first! {
                if s1Indices[j] < s1Indices.first! {
                    j += 1
                }
                if s2Indices[k] < s2Indices.first! {
                    k += 1
                }
            } else if s1Indices[j] < s1Indices.last! && s2Indices[k] < s2Indices.last! && s1Indices[j+1] < s2Indices[k+1] {
                j += 1
            } else {
                k += 1
            }
            length += 1
        }
        if length > maxLength {
            maxLength = length
        }
    }
    
    return maxLength - 1
}


result = commonChild(s1: "ABCD", s2: "ABDC")
print("result:\(result)")


func commonChild2(s1: String, s2: String) -> Int {
    let s1Array = Array(s1)
    let s2Array = Array(s2)
    
    var memo = Array(repeating: Array(repeating: 0, count: s2.count + 1), count: s1.count + 1)
    
    for i in 1...s1.count {
        for j in 1...s2.count {
            if s1Array[i-1] == s2Array[j-1] {
                memo[i][j] = memo[i-1][j-1] + 1
            } else {
                memo[i][j] = max(memo[i-1][j], memo[i][j-1])
            }
        }
    }
    
    return memo[s1.count][s2.count]
}

result = commonChild2(s1: "ABCD", s2: "ABDC")
print("result:\(result)")

func commonChild3(s1: String, s2: String) -> Int {
    var suffixes = Array(repeating: Array(repeating: 0, count: s2.count + 1), count: 2)
    var activeRow = 0
    
    for i in s1.indices {
        let prevRow = activeRow
        activeRow = 1 - activeRow
        
        for j in s2.indices {
            if s1[i] == s2[j] {
                suffixes[activeRow][j+1] = suffixes[prevRow][j] + 1
            } else {
                suffixes[activeRow][j+1] = max(suffixes[activeRow][j], suffixes[prevRow][j+1])
            }
        }
    }
    
    return suffixes[activeRow][s2.count]
}

result = commonChild3(s1: "ABCD", s2: "ABDC")
print("result:\(result)")

func commonChild4(s1: String, s2: String) -> Int {
    let s1Array = Array(s1)
    let s2Array = Array(s2)
    
    var memo = Array(repeating: Array(repeating: 0, count: s2.count + 1), count: s1.count + 1)
    
    for i in 1...s1.count {
        memo[i] = (1...s2.count).reduce([0]) { (prev, j) in
            if s1Array[i-1] == s2Array[j-1] {
                return prev + [memo[i-1][j-1] + 1]
            } else {
                return prev + [max(memo[i-1][j], memo[i][j-1])]
            }
        }
    }
    
    return memo[s1.count][s2.count]
}

result = commonChild4(s1: "ABCD", s2: "ABDC")
print("result:\(result)")
