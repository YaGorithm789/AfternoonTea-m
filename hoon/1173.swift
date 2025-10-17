let nums = readLine()!.split(separator: " ").map { Int($0)! }
let N = nums[0], m = nums[1], M = nums[2], T = nums[3], R = nums[4]

if m + T > M {
    print(-1)
} else {
    var time = 0
    var done = 0
    var pulse = m

    while done < N {
        if pulse + T <= M {
            pulse += T
            done += 1
        } else {
            pulse = max(m, pulse - R)
        }
        
        time += 1
    }

    print(time)
}
