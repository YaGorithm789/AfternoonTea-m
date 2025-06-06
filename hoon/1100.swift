var count = 0

for i in 0..<8 {
    let str = readLine()!.map { String($0) }
    
    for j in 0..<8 {
        if (i + j) % 2 == 0 && str[j] == "F" {
            count += 1
        }
    }
}

print(count)
