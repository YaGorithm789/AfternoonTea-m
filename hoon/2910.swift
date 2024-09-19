typealias Count = (fq: Int, v: Int, s: Int)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let c = input[1]
var nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var counter = [Int: [Int]]()
var i = 0

nums.forEach {
    if counter.keys.contains($0) {
        counter[$0]![0] += 1
    } else {
        counter[$0] = [1, i]
        i += 1
    }
}

var resultNums = [Count]()
var res = ""

for i in counter {
    resultNums.append((i.value[0], i.key, i.value[1]))
}

resultNums.sort { $0.fq == $1.fq ? $0.s < $1.s : $0.fq > $1.fq }
resultNums.forEach {
    res += String(repeating: "\($0.v) ", count: $0.fq)
}

print(res)
