let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c) = (input[0], input[1], input[2])

func pow(a: Int, b: Int, c: Int) -> Int {
    if b == 1 { return a % c }
    
    var result = pow(a: a, b: b / 2, c: c)
    result = result * result % c
    
    if b % 2 == 0 { return result }
    
    return result * a % c
}

print(pow(a: a, b: b, c: c))
