let inp = readLine()!.split(separator: " " ).map { Int(String($0))! }
let N = inp[0], M = inp[1]
let times = readLine()!.split(separator: " " ).map { Int(String($0))! }
var l = 0, r = 60_000_000_000
var s = 0

while l <= r {
    let mid = (l + r) / 2
    s = 0
    
    times.forEach{
        s += mid / $0 + 1
    }
    
    if s >= N {
        r = mid - 1
    } else {
        l = mid + 1
    }
}

s = 0

if l != 0 {
    times.forEach {
        s += (l - 1) / $0 + 1
    }
}

for i in 0..<M {
    if l % times[i] == 0 {
        s += 1
    }
    
    if s == N {
        print(i + 1)
        break
    }
}
