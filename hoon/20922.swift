let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let sequence = readLine()!.split(separator: " ").map { Int($0)! }
var (left, right, ans) = (0, 0, 0)
var countSequence = Array(repeating: 0, count: sequence.max()! + 1)

while right < n {
    if countSequence[sequence[right]] < k {
        countSequence[sequence[right]] += 1
        right += 1
    } else {
        countSequence[sequence[left]] -= 1
        left += 1
    }
    
    ans = max(ans, right - left)
}

print(ans)
