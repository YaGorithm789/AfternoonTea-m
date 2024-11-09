let s = readLine()!.map { $0 }
var strings: Set<String> = []

for i in 0..<s.count {
    var string = ""
    
    for j in i..<s.count {
        string += String(s[j])
        strings.insert(string)
    }
}

print(strings.count)
