let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = arr[0] - 1
let B = arr[1] - 1
var numbers = [Int]()
var cur = 1
var count = 0

while numbers.count <= B {
    numbers.append(cur)
    count += 1
    
    if count == cur {
        cur += 1
        count = 0
    }
}

print(numbers[A...B].reduce(0, +))
