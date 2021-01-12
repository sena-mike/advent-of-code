// Day 1
//print(day1Part1())
// print(day1Part2())

// Day 2
// print(day2Input
//     .split { $0.isNewline }
//     .map { String($0) }
//     .map { parsePositionRequirement(input: $0) }
//     .filter { (policy, password) in 
//         return password.isValidPassword(with:policy) 
//         }.count)

print(computeHits(on: day3Map, mapSize: 32, slope: (3, 1)))