let s = readLine()!.filter { $0.isLetter }.map(String.init)
let k = readLine()!.map(String.init)

func getFailure(target: [String]) -> [Int] {
    var failure = Array(repeating: 0, count: target.count)
    var length = 0
    var index = 1
    
    while index < target.count {
        if target[index] == target[length] {
            length += 1
            failure[index] = length
            index += 1
        } else {
            if length == 0 {
                failure[index] = 0
                index += 1
            } else {
                length = failure[length - 1]
            }
        }
    }
        
    return failure
}

func KMP(source: [String], target: [String]) -> Bool {
    var sourceIndex = 0
    var targetIndex = 0
    let failure = getFailure(target: target)
    
    while sourceIndex < source.count {
        if target[targetIndex] == source[sourceIndex] {
            sourceIndex += 1
            targetIndex += 1
            
            if targetIndex == target.count {
                return true
            }
        } else {
            if targetIndex == 0 {
                sourceIndex += 1
            } else {
                targetIndex = failure[targetIndex - 1]
            }
        }
    }
    
    return false
}

print(KMP(source: s, target: k) ? 1 : 0)
