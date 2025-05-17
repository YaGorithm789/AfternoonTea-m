import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var words = [Int]()

for _ in 0..<n {
    let word = readLine()!
    var bitmask = 0
    
    for chr in word {
        bitmask = bitmask | (1 << Int(chr.asciiValue! - 97))
    }
    
    words.append(bitmask)
}

if k < 5 {
    print(0)
    exit(0)
}

let base: [Character] = ["a", "n", "t", "i", "c"]
var baseBitmask = 0

for chr in base {
    baseBitmask = baseBitmask | (1 << Int(chr.asciiValue! - 97))
}

func countReadableWords(_ bitmask: Int) -> Int {
    var count = 0
    
    for word in words {
        if (word & bitmask) == word {
            count += 1
        }
    }
    
    return count
}

var maxCount = 0

func dfs(_ index: Int, _ bitmask: Int, _ depth: Int) {
    if depth == k - 5 {
        maxCount = max(maxCount, countReadableWords(bitmask))
        return
    }
    
    for i in index..<26 {
        if (bitmask & (1 << i)) == 0 {
            dfs(i + 1, bitmask | (1 << i), depth + 1)
        }
    }
}

dfs(0, baseBitmask, 0)
print(maxCount)
