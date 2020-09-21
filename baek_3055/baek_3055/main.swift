//
//  main.swift
//  baek_3055
//
//  Created by seungbong on 2020/09/19.
//  Copyright © 2020 한승희. All rights reserved.
//

import Foundation

/*
3 3
D.*
...
.S.
 */
func input() -> [[Character]] {

    guard let rowAndCol = readLine()?.components(separatedBy: " ") else {
        return [[]]
    }

    let row = Int(rowAndCol[0]) ?? 0
    let col = Int(rowAndCol[1]) ?? 0
    var map: [[Character]] = []

    for i in 0..<row {
        if let iput = readLine() {
            for j in 0..<input.count {
                
            }
        }
    }

    return map
}



print(input())
