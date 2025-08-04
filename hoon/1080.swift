let input = readLine()!.split(separator:" ").map { String($0) }.map { Int($0)! }
let N = input[0]
let M = input[1]
var A: [[Int]] = []
var B: [[Int]] = []
var cnt = 0

for _ in 0...N - 1 {
    A.append(readLine()!.map { String($0) }.map { Int($0)! })
}
  
for _ in 0...N - 1 {
    B.append(readLine()!.map { String($0) }.map { Int($0)! })
}

func flip(_ i: Int, _ j: Int) {
    for x in i..<i + 3 {
        for y in j..<j + 3 {
            A[x][y] = 1 - A[x][y]
        }
    }
}

if N<3 || M<3 {
    if A != B {
        print(-1)
    } else {
        print(0)
    }
} else {
    for i in 0..<N - 2 {
        for j in 0..<M - 2 {
            if A[i][j] != B[i][j]{
                flip(i, j)
                cnt += 1
            }

            if A == B{
                break
            }

            if A == B{
                break
            }    
        }
    }
        
    if A != B{
        print(-1)
    } else {
        print(cnt)
    }
}
