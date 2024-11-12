while true {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let n = line[0]
    
    if n == 0 { break }
    
    let arr = Array(line[1...]) + [-1]
    var maxArea = 0
    var stack = [-1]
    
    for i in 0...n {
        while stack.count > 1 && arr[stack.last!] > arr[i] {
            let height = arr[stack.removeLast()]
            let width = i - stack.last! - 1
            maxArea = max(maxArea, height * width)
        }
        
        stack.append(i)
    }
    
    print(maxArea)
}
