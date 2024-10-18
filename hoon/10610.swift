var input = Array(readLine()!).sorted(by: >)
let sum = input.reduce(0) { $0 + Int(String($1))! }

if input.last! != Character("0") || sum % 3 != 0 {
    print("-1")
} else {
    print(String(input))
}
