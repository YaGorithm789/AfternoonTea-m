let n = Int(readLine()!)!
var start = 1
var end = 2
var answer = [Int]()

func square(_ n: Int) -> Int {
    return n * n
}

while true {
    if start == end - 1 {
        if square(end) - square(start) > n {
            break
        }
    }

    if square(end) - square(start) < n {
        end += 1
    } else if square(end) - square(start) > n {
        start += 1
    } else {
        answer.append(end)
        start += 1
        end += 1
    }
}

if answer.isEmpty {
    print(-1)
} else {
    for item in answer {
        print(item)
    }
}
