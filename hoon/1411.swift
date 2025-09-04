import Foundation

func standardize(_ word: String) -> [Int] {
    var mapping = [Character: Int]()
    var nextCode = 0
    var standardizedWord = [Int]()

    for character in word {
        if mapping[character] == nil {
            mapping[character] = nextCode
            nextCode += 1
        }
      
        standardizedWord.append(mapping[character]!)
    }
  
    return standardizedWord
}

func createStandardizedList(_ words: [String]) -> [[Int]] {
    var standardizedList = [[Int]]()
    for word in words {
        standardizedList.append(standardize(word))
    }
    return standardizedList
}

func countSimilarWords(words: [String]) -> Int {
    guard words.count > 1 else { return 0 }
    
    let standardizedWords = createStandardizedList(words)
    var count = 0
    
    for i in 0..<standardizedWords.count {
        for j in (i + 1)..<standardizedWords.count {
            if standardizedWords[i] == standardizedWords[j] {
                count += 1
            }
        }
    }
    
    return count
}

let n = Int(readLine()!)!
var inputWords: [String] = []

for _ in 0..<n {
    if let word = readLine() {
        inputWords.append(word)
    }
}

let result = countSimilarWords(words: inputWords)
print(result)
