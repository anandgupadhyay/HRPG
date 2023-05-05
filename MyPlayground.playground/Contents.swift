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


