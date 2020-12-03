import Foundation

enum PasswordPolicy {
    case characterRequirement(Character, Int, Int)
    // case characterPosition(Character, Int, Int)
}

extension String {
    func isValidPassword(with policy: PasswordPolicy) -> Bool {
        switch policy {
        case .characterRequirement(let character, let min, let max):
            let count = filter { $0 == character }.count
            return (count >= min) && (count <= max)
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
