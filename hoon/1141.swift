import Foundation

func solution() -> Int {
    
    // input
    let n: Int = Int(readLine()!)!
    var words: [String] = []
    
    for _ in 0..<n {
        words.append(readLine()!)
    }
    
    // process
    var result = n
    words.sort()
    
    for (i, word) in words.enumerated() {
        for j in i + 1..<n {
            if words[j].starts(with: word) {
                result -= 1
                break
            }
        }
    }
    
    return result
    
}


print(solution())
