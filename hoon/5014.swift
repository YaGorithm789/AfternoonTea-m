let input = readLine()!.split(separator: " ").map { Int($0)! }
let (f, s, g, u, d) = (input[0], input[1] - 1, input[2] - 1, input[3], input[4])
var building = Array(repeating: -1, count: f)
var queue = [s]
building[s] = 0

while queue.isEmpty == false {
    if building[g] != -1 {
        print(building[g])
        break
    }
    
    let current = queue.removeFirst()
    
    for i in [u, -d] {
        guard 0..<f ~= current + i,
              building[current + i] == -1
        else { continue }
        
        building[current + i] = building[current] + 1
        queue.append(current + i)
    }
}

if building[g] == -1 { print("use the stairs") }
