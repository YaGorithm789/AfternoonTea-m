let N = Int(readLine()!)!
var sn = [String](repeating: "", count: N)

for i in 0..<N {
    sn[i] = String(readLine()!.reversed())
}

for i in 0..<sn[0].count {
    var set = Set<String>()
    let end = sn[0].index(sn[0].startIndex, offsetBy: i)
    
    for j in 0..<N {
        set.insert(String(sn[j][...end]))
    }
    
    if set.count == N {
        print(i + 1)
        break
    }
}
