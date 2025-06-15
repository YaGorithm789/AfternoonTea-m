var input = readLine()!
let arr = ["a", "e", "i", "o", "u"]

while input != "#" {
    print(input.lowercased().filter { arr.contains(String($0)) }.count)
    input = readLine()!
}
