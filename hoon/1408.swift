import Foundation

let startTime = readLine()!
let endTime = readLine()!

func timeToSeconds(time: String) -> Int {
    let components = time.split(separator: ":").map { Int($0)! }
    return components[0] * 3600 + components[1] * 60 + components[2]
}

let startSeconds = timeToSeconds(time: startTime)
let endSeconds = timeToSeconds(time: endTime)
var timeDifference = endSeconds - startSeconds

if timeDifference < 0 {
    timeDifference += 24 * 3600
}

let hours = timeDifference / 3600
let minutes = (timeDifference % 3600) / 60
let seconds = timeDifference % 60

print(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
