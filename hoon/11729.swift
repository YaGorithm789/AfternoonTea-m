let n = Int(readLine()!)!
var result = ""

func hanoi(_ start: Int, _ end: Int, _ n: Int) {
    if n == 1 {
        result += "\(start) \(end)\n"
        return
    }
    
    hanoi(start, 6 - start - end, n - 1)
    result += "\(start) \(end)\n"
    hanoi(6 - start - end, end, n - 1)
}

hanoi(1, 3, n)
print(1 << n - 1)
print(result)
