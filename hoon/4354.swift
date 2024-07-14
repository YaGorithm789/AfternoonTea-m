while let t = readLine()?.map(String.init), t != ["."] {
    var failure = getFailure(target: t)
    let number = t.count - failure.last!
    
    print(t.count % number == 0 ? t.count / number : 1)
}

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
