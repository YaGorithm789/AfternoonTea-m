import Foundation

// 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 노래 개수
let l = input[1] // 노래 길이
let d = input[2] // 벨 간격

// 전체 시간을 시뮬레이션할 배열을 선언하고 초기화합니다.
// 전화벨이 울릴 수 있는 최대 시간을 고려합니다.
let maxTime = n * (l + 5) // 총 시간은 (노래길이 + 5초) * 노래개수
var isRinged = Array(repeating: false, count: maxTime)

// 노래가 재생되는 시간 (노래 1곡당 5초)
for i in 0..<n {
    for j in (i * (l + 5))..<((i * (l + 5)) + l) {
        if j < maxTime {
            isRinged[j] = true // 노래 재생 중
        }
    }
}

// 전화벨이 울리는 시간 (노래와 노래 사이 간격)
for i in 0..<n {
    for j in ((i * (l + 5)) + l)..<((i * (l + 5)) + 5) {
        if j < maxTime {
            isRinged[j] = false // 전화벨 울리는 중
        }
    }
}

// 전화벨이 울리지 않는 가장 빠른 시간을 찾습니다.
var answer = 0
for i in 0..<maxTime {
    if !isRinged[i] { // 전화벨이 울리지 않는 구간
        answer = i
        break // 가장 빠른 시간을 찾았으므로 반복 중단
    }
    // 벨 간격 5초마다 전화벨 울리는 시간 건너뛰기 (아래 코드는 필요 없으므로 주석 처리)
    // if (i + 1) % d == 0 && !isRinged[i] {
    //    answer = i + 1
    //    break
    // }
}

print(answer)
