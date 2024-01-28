var result = ""

while let input = readLine(), input != "0" {
    let ks = input.split(separator: " ")
    let k = Int(ks[0])!
    let s = ks[1...].map { Int($0)! }
    var number = [Int]()
    var isUsed = Array(repeating: false, count: k)
    
    func back() {
        if number.count == 6 {
            result += number.map(String.init).joined(separator: " ") + "\n"
            
            return
        }
        
        let last = number.last ?? 0
        
        for i in 0..<k {
            guard !isUsed[i], last < s[i] else { continue }
            
            isUsed[i] = true
            number.append(s[i])
            back()
            isUsed[i] = false
            number.removeLast()
        }
    }
    
    back()
    result += "\n"
}

print(result)
