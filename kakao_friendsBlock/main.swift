//
//  main.swift
//  Algorithm
//
//  Created by seungbong on 2020/08/13.
//  Copyright © 2020 한승희. All rights reserved.
//

import Foundation

private struct Pos {
    var r: Int
    var c: Int
}

private let r_offset = [0, 1, 0, 1]
private let c_offset = [0, 0, 1, 1]


func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {

    /// [String] -> [[String]]
    var map = [[String]]()
    for line in board {
        var row = [String]()
        for block in line {
            row.append(String(block))
        }
        map.append(row)
    }
    
    var totalCount = 0
    while (true) {
        /// 2x2를 만족하는 블럭의 첫번째 위치(왼위) 리스트 찾기
        var targetList = getTargetBlockHeadList(map: map)
        if targetList.isEmpty {
            break
        }

        /// 타겟 블럭 표시 및 카운트
        var count = 0
        while !targetList.isEmpty {
            let targetPos = targetList.removeFirst()
            for i in 0..<4 {
                if map[targetPos.r + r_offset[i]][targetPos.c + c_offset[i]] != " " {
                    map[targetPos.r + r_offset[i]][targetPos.c + c_offset[i]] = " "
                    count += 1
                }
            }
        }
        totalCount += count
        
        /// 타겟 블럭 지우기
        for r in 0..<map.count {
            for c in 0..<map[r].count {
                if map[r][c] == " " {
                    deleteBlock(map: &map, pos:Pos(r: r, c: c))
                }
            }
        }
    }

    return totalCount
}

private func getTargetBlockHeadList(map: [[String]]) -> [Pos] {
    var targetList = [Pos]()
    for r in 0..<map.count-1 {
        for c in 0..<map[r].count-1 {
            if map[r][c] != " " {
                if map[r][c] == map[r+1][c] && map[r][c] == map[r][c+1] && map[r][c] == map[r+1][c+1] {
                    targetList.append(Pos(r: r, c: c))
                }
            }
        }
    }
    
    return targetList
}

private func deleteBlock(map: inout [[String]], pos: Pos) {
    for r in stride(from: pos.r, through: 0, by: -1) {
        map[r][pos.c] = (r == 0) ? " " : map[r-1][pos.c]
    }
}


print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))
print(solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]))
