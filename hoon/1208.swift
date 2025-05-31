let ns = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = ns[0]
let s = ns[1]
var count = 0
var dict = [Int: Int]()

func rightSeq(_ mid: Int, _ sum: Int) {
    if mid == n {
        if dict[sum] != nil {
            dict[sum]! += 1
        } else {
            dict[sum] = 1
        }
        
        return
    }
    
    rightSeq(mid + 1, sum + arr[mid])
    rightSeq(mid + 1, sum)
}

func leftSeq(_ st: Int, _ sum: Int) {
    if st == n / 2 {
        if dict[s - sum] != nil {
            count += dict[s - sum]!
        }
        
        return
    }
    
    leftSeq(st + 1, sum + arr[st])
    leftSeq(st + 1, sum)
}

rightSeq(n / 2, 0)
leftSeq(0, 0)

if s == 0{
    count -= 1
}

print(count)
