import Foundation

let n = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
var representatives: [String] = []

for _ in 0..<n {
    let word = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
    var isNew = true
    
    for rep in representatives {
        if rep.count == word.count {
            // rep를 두 번 이어붙인 문자열 안에 word가 포함되면 회전 관계
            if (rep + rep).contains(word) {
                isNew = false
                break
            }
        }
    }
    
    if isNew {
        representatives.append(word)
    }
}

print(representatives.count)
