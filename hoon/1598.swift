let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0]
let b = input[1]

func getCoordinates(num: Int) -> (Int, Int) {
    let row = (num - 1) / 4
    let col = (num - 1) % 4
    return (row, col)
}

let (ax, ay) = getCoordinates(num: a)
let (bx, by) = getCoordinates(num: b)

print(abs(ax - bx) + abs(ay - by))
