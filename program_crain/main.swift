import UIKit
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var result = 0
    var basket: [Int] = []
    var board_cpy = board
    
    for col in moves {
        // 타겟 인형 찾기
        var target = 0
        for row in 0..<board_cpy.count {
            if board_cpy[row][col-1] != 0 {
                target = board_cpy[row][col-1]
                board_cpy[row][col-1] = 0
                break
            }
        }
        
        // 해당칸에 인형이 없는 경우
        if target == 0 {
            break;
        }
         
        // 바구니와 비교하기
        if basket.count == 0 {
            basket.append(target)
        } else {
            let top = basket[basket.count-1]
            if top == target {
                basket.remove(at: basket.count-1)
                result += 2
            } else {
                basket.append(target)
            }
        }
    }
    
    
    return result
}

print(solution([[0,0,0,0,0],
                [0,0,1,0,3],
                [0,2,5,0,1],
                [4,2,4,4,2],
                [3,5,1,3,1]], [5,5,3,1,1,1,3]))
