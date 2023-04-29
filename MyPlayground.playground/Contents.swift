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
            if s1Array.firstIndex(of: commonChars[i])! < s1Array.firstIndex(of: commonChars[j])! &&
                s2Array.firstIndex(of: commonChars[i])! < s2Array.firstIndex(of: commonChars[j])! {
                length += 1
            }
        }
        if length > maxLength {
            maxLength = length
        }
    }
    
    return maxLength
}

let result = commonChild(s1: "ABCD", s2: "ABDC")
print("result:\(result)")

