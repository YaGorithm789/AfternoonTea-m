let nums = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nums[0]
let m = nums[1]

func get2(_ num: Int) -> Int {
    var count = 0
    var i = 2
    
    while num >= i {
        count += num / i
        i *= 2
    }
    
    return count
}

func get5(_ num: Int) -> Int {
    var count = 0
    var i = 5
    
    while num >= i {
        count += num / i
        i *= 5
    }

    return count
}

let a = get2(n) - (get2(m) + get2(n - m))
let b = get5(n) - (get5(m) + get5(n - m))

print(a > b ? b : a)
