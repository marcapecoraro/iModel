import Foundation

struct Local: Codable {
	let id: Int
	let type: String
	let surface: String
	let orientation: String
	let statut: String
	let terrasse: String
	let balcon: String
	let pin: Pin

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
