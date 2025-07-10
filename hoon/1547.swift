var ball = 1

for _ in 0..<Int(readLine()!)! {
    let swap = readLine()!.split(separator: " ").map { Int($0)! }.filter { $0 != ball }
    
    if swap.count == 1 {
        ball = swap[0]
    }
}

print(ball)
