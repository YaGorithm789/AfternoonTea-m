import Foundation

func solution(_ s: String) -> Int {
    let aCount = s.filter { $0 == "a" }.count
    if aCount == 0 { return 0 } // 'a'가 없으면 교환할 필요 없음

    let doubledS = s + s // 원형 문자열 처리를 위해 두 번 붙임
    var minBCount = aCount // 'a'의 개수만큼 초기화 (최악의 경우)

    for i in 0..<s.count {
        let endIndex = doubledS.index(doubledS.startIndex, offsetBy: i + aCount)
        let window = String(doubledS[doubledS.index(doubledS.startIndex, offsetBy: i)..<endIndex])
        let bCountInWindow = window.filter { $0 == "b" }.count
        minBCount = min(minBCount, bCountInWindow)
    }

    return minBCount
}
