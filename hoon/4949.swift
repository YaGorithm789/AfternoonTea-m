while let s = readLine(), s != "." {
    var stack = [Character]()
    
    for char in s {
        if !["[", "]", "(", ")"].contains(char) {
            continue
        }
        if char == "]" && stack.last == "[" {
            stack.removeLast()
        } else if char == ")" && stack.last == "(" {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    print(stack.isEmpty ? "yes" : "no")
}
