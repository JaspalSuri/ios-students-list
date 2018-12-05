import Foundation

struct Student: Codable {
    var name: String
    
    var firstName: String {
        return String(name.split(separator: " ")[0])
    }
    
    var lastName: String? {
        guard let last = name.split(separator: " ").dropFirst().last else { return nil }
        return String(last)
    }
}
