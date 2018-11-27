import Foundation

struct UserBasic {
	let id: Int
	let email: String
	let firstname: String
	let lastname: String
	let telephone: String
	let location: String

	init(id: Int, email: String, firstname: String, lastname: String, telephone: String, location: String) {
		self.id = id
		self.email = email
		self.firstname = firstname
		self.lastname = lastname
		self.telephone = telephone
		self.location = location
	}

	func getAllProperties() -> [[String: Any]] {

		var result: [[String: Any]] = []
		let mirror = Mirror(reflecting: self)

		for (property, value) in mirror.children where value is String {
			guard let property = property else {
				continue
			}
			result.append([property : value])
		}

		return result
	}
}
