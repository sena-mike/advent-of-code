import Foundation

enum PasswordPolicy {
    case characterRequirement(Character, Int, Int)
    case characterPosition(Character, Int, Int)
}

extension String {
    func isValidPassword(with policy: PasswordPolicy) -> Bool {
        switch policy {
        case .characterRequirement(let character, let min, let max):
            let count = filter { $0 == character }.count
            return (count >= min) && (count <= max)
        case .characterPosition(
            let character, 
            let first, 
            let second):
            var matchedFirst = false
            var matchedSecond = false
            
            enumerated().forEach { offset, element in
                let adjustedOffset = offset + 1
                if adjustedOffset == first, element == character {
                    matchedFirst = true
                } else if adjustedOffset == second, element == character {
                    matchedSecond = true
                }
            }
            
            return (matchedFirst && !matchedSecond) || (!matchedFirst && matchedSecond)
        }
    }
}

func parseCharacterRequirement(input: String) -> (PasswordPolicy, String) {

    let components = input.components(separatedBy: " ")

    let countComponent = components[0]
    let character = components[1].first!
    let password = components[2]

    let countComponents = countComponent.components(separatedBy: "-")
    let min = Int(countComponents[0])!
    let max = Int(countComponents[1])!
    
    return (.characterRequirement(character, min, max), password)
}

func parsePositionRequirement(input: String) -> (PasswordPolicy, String) {

    let components = input.components(separatedBy: " ")

    let countComponent = components[0]
    let character = components[1].first!
    let password = components[2]

    let countComponents = countComponent.components(separatedBy: "-")
    let first = Int(countComponents[0])!
    let second = Int(countComponents[1])!
    
    return (.characterPosition(character, first, second), password)
}
