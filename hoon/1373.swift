var input = Array(readLine()!)

if input.count % 3 == 1 {
    input.insert("0", at: 0)
    input.insert("0", at: 0)
} else if input.count % 3 == 2 {
    input.insert("0", at: 0)
}

for i in stride(from: 0, to: input.count - 1, by: 3) {
    let num = Int(String(input[i]))! * 4 + Int(String(input[i + 1]))! * 2 + Int(String(input[i + 2]))! * 1
    print(num, terminator: "")
}
