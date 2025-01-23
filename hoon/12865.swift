let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var cache = [Int](repeating: 0, count: k + 1)
var items: [(w: Int, v: Int)] = [(0, 0)]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    items.append((w: input[0], v: input[1]))
}

for i in 1...n {
    for j in (1...k).reversed() {
        if j >= items[i].w {
            cache[j] = max(cache[j], cache[j - items[i].w] + items[i].v)
        }
    }
}

print(cache[k])
