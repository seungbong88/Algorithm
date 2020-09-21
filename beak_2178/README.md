### 백준 2178 - 미로



익숙한 BFS 문제와 같이, BFS를 통해 인접한 곳으로 이동하면서 이동한 횟수를 count하는 문제이다.



> **문제**
https://www.acmicpc.net/problem/2178

N×M크기의 배열로 표현되는 미로가 있다.

| 1    | 0    | 1    | 1    | 1    | 1    |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 1    | 0    | 1    | 0    | 1    | 0    |
| 1    | 0    | 1    | 0    | 1    | 1    |
| 1    | 1    | 1    | 0    | 1    | 1    |

미로에서 1은 이동할 수 있는 칸을 나타내고, 0은 이동할 수 없는 칸을 나타낸다. 이러한 미로가 주어졌을 때, (1, 1)에서 출발하여 (N, M)의 위치로 이동할 때 지나야 하는 최소의 칸 수를 구하는 프로그램을 작성하시오. 한 칸에서 다른 칸으로 이동할 때, 서로 인접한 칸으로만 이동할 수 있다.

위의 예에서는 15칸을 지나야 (N, M)의 위치로 이동할 수 있다. 칸을 셀 때에는 시작 위치와 도착 위치도 포함한다.





> 풀이

1. **풀이 방법**

   - 한 칸에 인접한 값들을 탐색한 후에 이동 카운트를 증가시켜야 하기 때문에 두 개의 큐를 이용하는 방법을 사용했다.

   - 1. queue 에 시작 칸의 위치값을 담는다 (x, y)
     2. queue 에서 꺼낸 값들을 nextQueue라는 새로운 큐에 담는다.
     3. queue가 empty 상태가 되면 count를 증가시키고 nextQueue의 값을 다시 queue에 담는다.

   - 소스코드

     ```swift
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
     ```

     

*과거 풀이를 보니 시간은 줄었으나, 더 쉽고 편하게 풀 수 있는 방법이 있었다. 



2. **다른 풀이 방법**

   - 두 개의 queue를 사용하지 않고 하나의 queue를 사용하되 map의 값으로 count를 한다.

   - 비어있는 곳의 값이 모두 0임을 이용하여 탐색한 값은 인접한 값에 1을 더해주는 방법을 count 하는 방법

   - 소스코드

     ```swift
     func solution(map: inout [[Int]]) -> Int {
         
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
     ```

     

