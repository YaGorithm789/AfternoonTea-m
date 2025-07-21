func solve() {
    guard let input = readLine()?.split(separator: " ").compactMap({ Int($0) }),
          input.count == 2 else {
        return
    }

    let x = input[0]
    let y = input[1]
    let diff = y - x
    
    if diff <= 0 {
        print(0)
        return
    }

    var current = 0
    var days = 0
    var move = 1
    var step = 0

    while current < diff {
        days += 1
        step += 1
        current += move
        
        if step == 2 {
            move += 1
            step = 0
        }
        
    }
    
    print(days)
}

solve()
