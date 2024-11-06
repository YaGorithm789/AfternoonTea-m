let n = Int(readLine()!)!
var (A, B, C, D) = ([Int](), [Int](), [Int](), [Int]())
var (X, Y) = ([Int](), [Int]())
let arrayIndex = n * n - 1
var start = 0, end = arrayIndex
var answer = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    A.append(input[0])
    B.append(input[1])
    C.append(input[2])
    D.append(input[3])
}

for i in 0..<n {
    for j in 0..<n {
        X.append(A[i] + B[j])
        Y.append(C[i] + D[j])
    }
}

X.sort()
Y.sort()

while start <= arrayIndex && end >= 0 {
    var increase = 0, decrease = 0

    if X[start] + Y[end] > 0 {
        end -= 1
    } else if X[start] + Y[end] < 0 {
        start += 1
    } else {
        let xValue = X[start]
        let yValue = Y[end]

        while start <= arrayIndex && X[start] == xValue {
            start += 1
            increase += 1
        }
        
        while end >= 0 && Y[end] == yValue {
            end -= 1
            decrease += 1
        }

        answer += increase * decrease
    }
}

print(answer)
