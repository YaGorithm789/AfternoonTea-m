let n = Int(readLine()!)!
var media: [[Character]] = []

for _ in 0..<n {
    media.append(readLine()!.map { $0 })
}

var answer = ""

func compression(y: Int, x: Int, n: Int) {
    var zeroCount = 0
    var oneCount = 0
    
    for y in y..<y + n {
        for x in x..<x + n {
            if media[y][x] == "0" {
                zeroCount += 1
            } else {
                oneCount += 1
            }
        }
    }
    
    if zeroCount == n * n {
        answer += "0"
        return
    }
    
    if oneCount == n * n {
        answer += "1"
        return
    }
    
    answer += "("
    compression(y: y, x: x, n: n / 2)
    compression(y: y, x: x + n / 2, n: n / 2)
    compression(y: y + n / 2, x: x, n: n / 2)
    compression(y: y + n / 2, x: x + n / 2, n: n / 2)
    answer += ")"
}

compression(y: 0, x: 0, n: n)
print(answer)
