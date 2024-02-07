let n = Int(readLine()!)!
var students = [(name: String, korean: Int, english: Int, math: Int)]()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map(String.init)
    students.append((input[0], Int(input[1])!, Int(input[2])!, Int(input[3])!))
}

students.sorted {
    if $0.korean != $1.korean {
        return $0.korean > $1.korean
    } else if $0.english != $1.english {
        return $0.english < $1.english
    } else if $0.math != $1.math {
        return $0.math > $1.math
    } else {
        return $0.name < $1.name
    }
}.forEach { print($0.name) }
