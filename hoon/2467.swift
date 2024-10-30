let N = Int(readLine()!)!
let list = readLine()!.split(separator: " " ).map { Int(String($0))! }
var left = 0, right = list.count - 1
var answer = [Int]()
var dist = Int.max

func check(_ sum: Int) {
    let dis = abs(sum)
    
    if dist > dis {
        dist = dis
        answer = [list[left], list[right]]
    }
}

while left < right {
    let sum = list[left] + list[right]
    
    if sum > 0 {
        check(sum)
        right -= 1
    } else if sum < 0 {
        check(sum)
        left += 1
    } else {
        answer = [list[left], list[right]]
        break
    }
}

print("\(answer.first!) \(answer.last!)")
