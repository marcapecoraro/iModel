import Foundation

struct Data: Decodable {
	let projects: [Project]
}

class DataModel {
	var projects = [Project]()

	init() {
		guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else { return }
		URLSession.shared.dataTask(with: url) { data, response, error in

			guard let data = data else { return }
			do {
				let values = try JSONDecoder().decode(Data.self, from: data)
				self.projects = values.projects
				print("JSON : data -> \(self.projects.count) projects")

			} catch let error {
				print("JSON Error -> \(error)")
			}

			}.resume()
	}
}



