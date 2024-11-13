while true {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let n = line[0]
    let arr = Array(line[1...])
    
    if n == 0 { break }
    
    func maxArea(_ left: Int, _ right: Int) -> Int {
        if left >= right {
            return arr[right]
        }
        
        let mid = (left + right) / 2
        
        return max(maxArea(left, mid), maxArea(mid + 1, right), centerMaxArea(left, right))
    }
    
    func centerMaxArea(_ left: Int, _ right: Int) -> Int {
        let mid = (left + right) / 2
        var (start, end) = (mid, mid)
        var height = arr[start]
        var area = height
        
        while left < start && end < right {
            if arr[start - 1] > arr[end + 1] {
                start -= 1
                height = min(height, arr[start])
            } else {
                end += 1
                height = min(height, arr[end])
            }
            
            area = max(area, height * (end - start + 1))
        }
        
        while left < start {
            start -= 1
            height = min(height, arr[start])
            area = max(area, height * (end - start + 1))
        }
        
        while end < right {
            end += 1
            height = min(height, arr[end])
            area = max(area, height * (end - start + 1))
        }
        
        return area
    }
    
    print(maxArea(0, n - 1))
}
