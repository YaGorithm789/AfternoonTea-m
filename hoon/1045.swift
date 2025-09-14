import Foundation

// ---------- Disjoint Set Union (Union-Find) ----------
final class DSU {
    private var parent: [Int]
    private var rank: [Int]
    init(_ n: Int) {
        parent = Array(0..<n)
        rank = Array(repeating: 0, count: n)
    }
    private func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = find(parent[x])
        return parent[x]
    }
    func union(_ a: Int, _ b: Int) -> Bool {
        var x = find(a), y = find(b)
        if x == y { return false }
        if rank[x] < rank[y] { swap(&x, &y) }
        parent[y] = x
        if rank[x] == rank[y] { rank[x] += 1 }
        return true
    }
}

// ---------- Main ----------
if let first = readLine() {
    let nm = first.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]

    // 입력: 인접행렬
    var adj: [Array<Character>] = []
    adj.reserveCapacity(n)
    for _ in 0..<n {
        adj.append(Array(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)))
    }

    // 간선 목록 (u < v)만, (u, v) 오름차순 = 우선순위
    var edges: [(u: Int, v: Int)] = []
    edges.reserveCapacity(n * (n - 1) / 2)
    for u in 0..<n {
        for v in (u + 1)..<n {
            if adj[u][v] == "Y" { edges.append((u, v)) }
        }
    }

    // 간선 수가 M보다 적으면 불가능
    if edges.count < m {
        print(-1)
        exit(0)
    }

    // 정렬 (이미 u<v 순서대로 추가했어도 안전하게 정렬)
    edges.sort { (a, b) -> Bool in
        if a.u != b.u { return a.u < b.u }
        return a.v < b.v
    }

    // MST 구성
    let dsu = DSU(n)
    var degree = Array(repeating: 0, count: n)
    var usedEdges = 0
    var leftover: [(Int, Int)] = []   // MST에 들어가지 않은 간선들(우선순위 순서 유지)

    for (u, v) in edges {
        if usedEdges == n - 1 { leftover.append((u, v)); continue }
        if dsu.union(u, v) {
            degree[u] += 1
            degree[v] += 1
            usedEdges += 1
        } else {
            leftover.append((u, v))
        }
    }

    // MST가 완성되지 않았으면 불가능
    if usedEdges != n - 1 {
        print(-1)
        exit(0)
    }

    // 남은 간선들에서 M - (N-1)개 추가
    let need = m - usedEdges
    if need > leftover.count {
        print(-1)
        exit(0)
    }
    for i in 0..<need {
        let (u, v) = leftover[i]
        degree[u] += 1
        degree[v] += 1
    }

    print(degree.map(String.init).joined(separator: " "))
}
