if let line = readLine() {
    let parts = line.split(separator: " ").compactMap { Int($0) }
    let N = parts[0], L = parts[1], D = parts[2]
    let cycle = L + 5                   // 노래 L초 + 공백 5초
    let albumEnd = N * cycle - 5        // 마지막 곡 뒤에는 공백 없음
    var t = 0
    var found = false
    
    while t <= albumEnd {
        let off = t % cycle
        
        if off >= L {                   // 공백 구간 [L, L+4]에 벨 시작
            print(t)
            found = true
            break
        }
        
        t += D
    }

    if !found {
        // 앨범 종료 뒤 처음 울리는 시각 (albumEnd를 초과하는 최초의 D 배수)
        let next = (albumEnd / D + 1) * D
        print(next)
    }
}
