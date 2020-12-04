//print(day1Part1())
// print(day1Part2())
print(day2Input
    .split { $0.isNewline }
    .map { String($0) }
    .map { parsePositionRequirement(input: $0) }
    .filter { (policy, password) in 
        return password.isValidPassword(with:policy) 
        }.count)