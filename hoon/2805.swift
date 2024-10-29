let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let trees = readLine()!.split(separator: " ").map { Int($0)! }

func condition(x: Int) -> Bool {
    return trees.map { max($0 - x, 0) }.reduce(0, +) >= m
}

func binarySearch() -> Int {
    var start = 0
    var end = trees.max()!
    
    while start <= end {
        let mid = (start + end) / 2
        
        if condition(x: mid) {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return end
}

print(binarySearch())
