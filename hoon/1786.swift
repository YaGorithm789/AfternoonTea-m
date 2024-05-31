let t = readLine()!.map(String.init)
let p = readLine()!.map(String.init)

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

func KMP(source: [String], target: [String]) {
    var sourceIndex = 0
    var targetIndex = 0
    let failure = getFailure(target: target)
    var count = 0
    var index = [String]()

    while sourceIndex < source.count {
        if target[targetIndex] == source[sourceIndex] {
            sourceIndex += 1
            targetIndex += 1

            if targetIndex == target.count {
                count += 1
                index.append(String(sourceIndex - targetIndex + 1))
                targetIndex = failure[targetIndex - 1]
            }
        } else {
            if targetIndex == 0 {
                sourceIndex += 1
            } else {
                targetIndex = failure[targetIndex - 1]
            }
        }
    }

    print(count)
    print(index.joined(separator: " "))
}

KMP(source: t, target: p)
