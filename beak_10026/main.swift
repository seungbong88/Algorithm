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

private let r_offset = [1, -1, 0, 0]
private let c_offset = [0, 0, 1, -1]

private func input() -> [[String]] {
    let n = Int(readLine()!) ?? 0
    var map = [[String]]()
    for _ in 0..<n {
        let input:String = readLine() ?? ""
        var rows = [String]()
        for j in input {
            rows.append("\(j)")
        }
        map.append(rows)
    }
    return map
}

func solution(n: Int, map: inout [[String]]) -> String {
    
    var normalCount = 0
    var weaknessCount = 0
    var queue: [Pos] = []
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            if !isVisited[i][j]{
                queue.append(Pos(r: i, c: j))
                isVisited[i][j] = true
                bfs(queue: &queue, map: &map, isVisited: &isVisited)
                normalCount += 1
            }
        }
    }
    
    isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            if map[i][j] == "G"{
                map[i][j] = "R"
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if !isVisited[i][j]{
                queue.append(Pos(r: i, c: j))
                isVisited[i][j] = true
                bfs(queue: &queue, map: &map, isVisited: &isVisited)
                weaknessCount += 1
            }
        }
    }
    
    return "\(normalCount) \(weaknessCount)"
}

private func bfs(queue: inout [Pos], map: inout [[String]], isVisited: inout [[Bool]]) {
    while !queue.isEmpty {
        let curPos = queue.removeFirst()
        for  i in 0..<4 {
            let nextPos = Pos(r: curPos.r + r_offset[i] , c: curPos.c + c_offset[i])
            if nextPos.r >= 0 && nextPos.r < map.count && nextPos.c >= 0 && nextPos.c < map[0].count {
                if isVisited[nextPos.r][nextPos.c] == false {
                    if map[curPos.r][curPos.c] == map[nextPos.r][nextPos.c] {
                        isVisited[nextPos.r][nextPos.c] = true
                        queue.append(nextPos)
                    }
                }
            }
        }
    }
}

var pictureMap = input()
print(solution(n: pictureMap.count, map: &pictureMap))
