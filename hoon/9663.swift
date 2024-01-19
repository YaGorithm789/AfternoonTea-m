let n = Int(readLine()!)!
var isUsed1 = Array(repeating: false, count: 40)
var isUsed2 = Array(repeating: false, count: 40)
var isUsed3 = Array(repeating: false, count: 40)
var cnt = 0

func back(cur: Int) {
    if cur == n {
        cnt += 1
        return
    }
    
    for i in 0..<n {
        if isUsed1[i] || isUsed2[i + cur] || isUsed3[cur - i + n - 1] {
            continue
        }
        
        isUsed1[i] = true
        isUsed2[i + cur] = true
        isUsed3[cur - i + n - 1] = true
        back(cur: cur + 1)
        isUsed1[i] = false
        isUsed2[i + cur] = false
        isUsed3[cur - i + n - 1] = false
    }
}

back(cur: 0)
print(cnt)
