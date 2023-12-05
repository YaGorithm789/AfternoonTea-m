let t = Int(readLine()!)!

for _ in 1...t {
    let ps = readLine()!
    var stack = [Character]()

    for char in ps {
        if char == ")" && stack.last == "(" {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }

    stack.isEmpty ? print("YES") : print("NO")
}
