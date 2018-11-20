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

	//For tests
	//self.init(id: 1, email: "marca.peco@gmail.com", firstname: "Marc-Antoine", lastname: "Pecoraro", telephone: "0699689968", location: "245 rue d'Arras, Biarritz")
}
