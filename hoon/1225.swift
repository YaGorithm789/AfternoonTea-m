let input = readLine()!.split(separator: " ").map { String($0) }
let (A, B) = (input[0].map { Int(String($0))! }, input[1].map { Int(String($0))! })

let firstSum = A.reduce(0) { (num1: Int, num2: Int) -> Int in
    return num1 + num2
}

let secondSum = B.reduce(0, +)
print(firstSum * secondSum)
