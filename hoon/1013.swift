import Foundation

func solve() {
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let input = readLine()!
        let regex = try! NSRegularExpression(pattern: "^(100+1+|01)+$", options: [])
        
        if regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count)) != nil {
            print("YES")
        } else {
            print("NO")
        }
    }
}

solve()
