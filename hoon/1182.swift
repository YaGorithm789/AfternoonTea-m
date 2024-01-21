let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, s) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var cnt = 0

func back(cur: Int, tot: Int) {
    if cur == n {
        if tot == s {
            cnt += 1
        }
        
        return
    }
    
    back(cur: cur + 1, tot: tot)
    back(cur: cur + 1, tot: tot + arr[cur])
}

back(cur: 0, tot: 0)

if s == 0 {
    cnt -= 1
}

print(cnt)
