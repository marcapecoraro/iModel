import UIKit

struct Project {
	let id: Int
	let name: String
	let location: String
	let descript: String
	let visuals:Array<String>
	var modelResources = (file: "", type: "")
	var local = (id: 0, type: "", surface: "", orientation: "", statut: "", terrasse: "", balcon: "")

	enum CodingKeys: String, CodingKey {
		case id = "projectId"
		case name
		case location
		case descript
		case visuals
		case modelResources
		case local
	}

	enum ModelResourcesCodingKeys: String, CodingKey {
		case file
		case type
	}

	enum LocalCodingKeys: String, CodingKey {
		case id = "localId"
		case type
		case surface
		case orientation
		case statut
		case terrasse
		case balcon
	}
}

extension Project: Encodable {
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(name, forKey: .name)
		try container.encode(location, forKey: .location)
		try container.encode(descript, forKey: .descript)
		try container.encode(visuals, forKey: .visuals)
		try container.encode(modelResources.file, forKey: .modelResources)
		try container.encode(modelResources.type, forKey: .modelResources)
		try container.encode(local.id, forKey: .local)
		try container.encode(local.type, forKey: .local)
		try container.encode(local.surface, forKey: .local)
		try container.encode(local.orientation, forKey: .local)
		try container.encode(local.statut, forKey: .local)
		try container.encode(local.terrasse, forKey: .local)
		try container.encode(local.balcon, forKey: .local)
		
	}
}

extension Project: Decodable {
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decode(Int.self, forKey: .id)
		name = try values.decode(String.self, forKey: .name)
		location = try values.decode(String.self, forKey: .location)
		descript = try values.decode(String.self, forKey: .descript)
		visuals = try values.decode(Array<String>.self, forKey: .visuals)

		let valuesModelResources = try values.nestedContainer(keyedBy: ModelResourcesCodingKeys.self, forKey: .modelResources)
		modelResources.file = try valuesModelResources.decode(String.self, forKey: .file)
		modelResources.type = try valuesModelResources.decode(String.self, forKey: .type)

		let valuesLocal = try values.nestedContainer(keyedBy: LocalCodingKeys.self, forKey: .local)
		local.id = try valuesLocal.decode(Int.self, forKey: .id)
		local.type = try valuesLocal.decode(String.self, forKey: .type)
		local.surface = try valuesLocal.decode(String.self, forKey: .surface)
		local.orientation = try valuesLocal.decode(String.self, forKey: .orientation)
		local.statut = try valuesLocal.decode(String.self, forKey: .statut)
		local.terrasse = try valuesLocal.decode(String.self, forKey: .terrasse)
		local.balcon = try valuesLocal.decode(String.self, forKey: .balcon)
	}
}
