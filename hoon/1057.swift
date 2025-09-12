let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var a = input[1], b = input[2]
var round = 1

func next(_ n: Int) -> Int {
    (n + 1) / 2
}

while true {
    if next(a) == next(b) {
        print(round)
        break
    }
    
    a = next(a)
    b = next(b)
    round += 1
}
