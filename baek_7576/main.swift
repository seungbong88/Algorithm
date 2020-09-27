//
//  main.swift
//  Algorithm
//
//  Created by seungbong on 2020/08/13.
//  Copyright © 2020 한승희. All rights reserved.
//

import Foundation

struct Pos {
    var row: Int
    var col: Int
}

let r_offset = [1, -1 , 0, 0]
let c_offset = [0, 0 , 1, -1]


func input() -> [[Int]] {
    
    guard let rowAndColomn = readLine()?.components(separatedBy: " ") else { return [[]] }
    let col = Int(rowAndColomn[0]) ?? 0
    let row = Int(rowAndColomn[1]) ?? 0
 
    var map = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)
    for i in 0..<row {
        guard let rowDatas = readLine()?.components(separatedBy: " ") else { return [[]] }
        for j in 0..<col {
            map[i][j] = Int(rowDatas[j]) ?? 0
        }
    }
    
    return map
}

func solution(map: inout [[Int]]) -> Int {
    
    // 빈 공간이 없으면 모든 토마토가 익어있는 상태
    if !isExistEmptySpace(map: map) {
        return 0
    }
    
    var resultDay = 0
    var queue = [Pos]()
    var nextQueue = [Pos]()

    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j] == 1 {
                queue.append(Pos(row: i, col: j))
            }
        }
    }
    
    var isChangedForOneDay = false
    while !queue.isEmpty {
        
        let curPos = queue.removeFirst()
        for i in 0..<4 {
            let nextPos = Pos(row: curPos.row + r_offset[i], col: curPos.col + c_offset[i])
            // 배열 범위 체크
            if nextPos.row >= 0 && nextPos.row < map.count && nextPos.col >= 0 && nextPos.col < map[0].count {
                if map[nextPos.row][nextPos.col] == 0 {
                    map[nextPos.row][nextPos.col] = 1
                    nextQueue.append(nextPos)
                    isChangedForOneDay = true
                }
            }
        }
        if queue.isEmpty {
            queue = nextQueue
            nextQueue.removeAll()
            // 토마토 변화 여부 확인
            if isChangedForOneDay == true {
                resultDay += 1
                isChangedForOneDay = false
            }
        }
    }
    
    // 하나라도 빈 공간이 있는지 확인
    if isExistEmptySpace(map: map) {
        return -1
    }
    
    return resultDay
}

func isExistEmptySpace(map: [[Int]]) -> Bool {
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j] == 0 {
                return true
            }
        }
    }
    return false
}


var inputMap = input()
print(solution(map: &inputMap))
