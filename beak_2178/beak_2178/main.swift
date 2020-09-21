//
//  main.swift
//  beak_2178
//
//  Created by seungbong on 2020/09/20.
//  Copyright © 2020 한승희. All rights reserved.
//

import Foundation

/*
4 6
101111
101010
101011
111011
*/

struct Pos {
    var x: Int
    var y: Int
}

let x_offset = [1, -1, 0, 0]
let y_offset = [0, 0, 1, -1]


func input() -> [[Int]] {
    var map: [[Int]] = []
    
    guard let rowAndCol = readLine()?.components(separatedBy: " ") else {
        return [[]]
    }
    
    let row = Int(rowAndCol.first ?? "") ?? 0
    for _ in 0..<row {
        var rowArr: [Int] = []
        let line = readLine() ?? ""
        for char in line {
            rowArr.append(Int("\(char)") ?? 0)
        }
        map.append(rowArr)
    }
    
    return map
}

func solution(map: inout [[Int]]) -> Int {
    
    var result = 1
    var queue: [Pos] = []
    var nextQueue: [Pos] = []

    queue.append(Pos(x: 0, y: 0))
    map[0][0] = 0
    
    while !queue.isEmpty {
        let curPos = queue.removeFirst()
        for i in 0..<4 {
            let nextPos = Pos(x: curPos.x + x_offset[i], y: curPos.y + y_offset[i])
            if nextPos.x >= 0 && nextPos.x < map.count && nextPos.y >= 0 && nextPos.y < map[0].count {
                if map[nextPos.x][nextPos.y] == 1 {
                    nextQueue.append(Pos(x: nextPos.x, y: nextPos.y))
                    map[nextPos.x][nextPos.y] = 0
                }
            }
        }
        // 이동횟수 증가
        if queue.isEmpty {
            result += 1
            queue = nextQueue
            nextQueue.removeAll()
            
            // (N,M)에 도달했는지 확인
            if map[map.count-1][map[0].count-1] == 0 {
                break
            }
        }
    }
    
    return result
}

func printMap(arr: [[Int]]) {
    for i in 0..<arr.count {
        print("\(arr[i])")
    }
}


func newSolution(map: inout [[Int]]) -> Int {
    
    var queue: [Pos] = []
    queue.append(Pos(x: 0, y: 0))
    
    while !queue.isEmpty {
        let curPos = queue.removeFirst()
        for i in 0..<4 {
            let nextPos = Pos(x: curPos.x + x_offset[i], y: curPos.y + y_offset[i])
            if nextPos.x >= 0 && nextPos.x < map.count && nextPos.y >= 0 && nextPos.y < map[0].count {
                if map[nextPos.x][nextPos.y] == 1 {
                    map[nextPos.x][nextPos.y] = map[curPos.x][curPos.y] + 1
                    queue.append(nextPos)
                }
            }
        }
    }
    
    return map[map.count-1][map[0].count-1]
}

func printArr(arr: [[Int]]) {
    for i in 0..<arr.count {
        print(arr[i])
    }
}

var map:[[Int]] = input()
print(newSolution(map: &map))
