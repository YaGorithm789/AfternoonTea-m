let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
let selected = readLine()!.split(separator: " ").map { Int(String($0))! }
var deque = Array(1...n)
var answer = 0

(0..<m).forEach { target in
    if deque.first! == selected[target] {
        deque.removeFirst()
    } else {
        let count = deque.firstIndex(of: selected[target])!
        
        if count <= deque.count / 2 {
            answer += count
            for _ in 1...count {
                deque.append(deque.removeFirst())
            }
        } else {
            answer += deque.count - count
            for _ in 1...deque.count - count {
                deque.insert(deque.removeLast(), at: 0)
            }
        }
        
        deque.removeFirst()
    }
}

print(answer)
