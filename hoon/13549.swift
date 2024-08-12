let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var times = Array(repeating: -1, count: 100001)
times[n] = 0
var queue = [n]
var idx = 0

while queue.count > idx {
    let current = queue[idx]
    idx += 1
    
    if current == k {
        break
    }
    
    if  current * 2 <= 100_000 && times[current * 2] == -1 {
        times[current * 2] = times[current]
        queue.append((current * 2))
    }
    
    if current - 1 >= 0 && times[current - 1] == -1 {
        times[current - 1] = times[current] + 1
        queue.append((current - 1))
    }
    
    if current + 1 <= 100000 && times[current + 1] == -1 {
        times[current + 1] = times[current] + 1
        queue.append((current + 1))
    }
}

print(times[k])
