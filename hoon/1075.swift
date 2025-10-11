import Foundation

let N = Int(readLine()!)!
let F = Int(readLine()!)!
let base = N - (N % 100)
let remainder = base % F
let add = (F - remainder) % F

print(String(format: "%02d", add))
