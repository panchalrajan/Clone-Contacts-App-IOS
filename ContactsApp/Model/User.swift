import Foundation

class User: NSObject {
    
    let firstName: String
    let lastName: String
    let company : String?
    let phoneNumbers: [String]
    let emailIds: [String]?
    
    init(firstName: String, lastName: String, company : String?, phoneNumbers: [String], emailIds: [String]? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.phoneNumbers = phoneNumbers
        self.emailIds = emailIds
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var primaryPhoneNumber: String? {
        return phoneNumbers.first
    }
    
    var allPhoneNumbers: String {
        return phoneNumbers.joined(separator: ", ")
    }
}
