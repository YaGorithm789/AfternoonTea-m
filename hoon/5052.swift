let t = Int(readLine()!)!

for i in 0..<t {
    let n = Int(readLine()!)!
    var str = [String]()
    var result = true
    
    for j in 0..<n {
        let num = readLine()!
        str.append(num)
    }
    
    str.sort(by: <)
    
    for j in 0..<str.count - 1 {
        if str[j + 1].hasPrefix(str[j]) {
            result = false
            break
        }
    }
    
    if result {
        print("YES")
    } else {
        print("NO")
    }
}
