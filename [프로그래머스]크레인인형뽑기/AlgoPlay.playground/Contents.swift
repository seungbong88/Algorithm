import UIKit
import Foundation


//func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
//
//    var map1: [String] = []
//    var map2: [String] = []
//    var result: [String] = []
//
//    for i in 0..<n {
//        map1.append(String(arr1[i], radix: 2))
//        map2.append(String(arr2[i], radix: 2))
//
//        while (map1[i].count < 5) {
//            map1[i] = "0" + map1[i]
//        }
//        while (map2[i].count < 5) {
//            map2[i] = "0" + map2[i]
//        }
//    }
//
//    for i in 0..<n {
//        for j in 0..<n {
//            if map1[i][j] == "0" && map2[i][j] == "0" {
//                result[i] += " "
//            } else {
//                result[i] += "#"
//            }
//        }
//    }
//
//
//    return result
//}

//매개변수    값
//n    5
//arr1    [9, 20, 28, 18, 11]
//arr2    [30, 1, 21, 17, 28]
//출력    ["#####","# # #", "### #", "# ##", "#####"]

//매개변수    값
//n    6
//arr1    [46, 33, 33 ,22, 31, 50]
//arr2    [27 ,56, 19, 14, 14, 10]
//출력    ["######", "### #", "## ##", " #### ", " #####", "### # "]


//print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))

// test
var testArr = ["안녕", "하세요"]
let testStr = "핼로우"
print(testStr.)
//print(testArr[0][0])
