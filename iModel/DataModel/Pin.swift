struct Pin: Codable {
	let color: String
	var position = (x: 0, y: 0, z: 0)

	enum CodingKeys: String, CodingKey {
		case color, position
	}

	enum PositionCodingKeys: String, CodingKey {
		case x, y, z
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		color = try values.decode(String.self, forKey: .color)

		let valuesPosition = try values.nestedContainer(keyedBy: PositionCodingKeys.self, forKey: .position)
		position.x = try valuesPosition.decode(Int.self, forKey: .x)
		position.y = try valuesPosition.decode(Int.self, forKey: .y)
		position.z = try valuesPosition.decode(Int.self, forKey: .z)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(color, forKey: .color)
		try container.encode(position.x, forKey: .position)
		try container.encode(position.y, forKey: .position)
		try container.encode(position.z, forKey: .position)
	}
}
