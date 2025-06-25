let inputN = Int(readLine()!)!
var targetArr = Array(repeating: [0], count: inputN)

for i in 0..<inputN {
    targetArr[i] = [Int(readLine()!)!, i]
}

var tempArr = targetArr.sorted { $0[0] < $1[0] }
var solarr = Array(repeating: 0, count: inputN)

for i in 0..<inputN {
    solarr[i] = tempArr[i][1] - i
}

print(solarr.max()! + 1)
