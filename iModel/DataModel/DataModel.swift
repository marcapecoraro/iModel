import Foundation

struct Data: Decodable {
	let projects: [Project]
	let userProjects: [Project]
}

class DataModel {
	var projects = [Project]()
	var userProjects = [Project]()

	init() {
		guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else { return }
		URLSession.shared.dataTask(with: url) { data, response, error in

			guard let data = data else { return }
			do {
				let values = try JSONDecoder().decode(Data.self, from: data)
				self.projects = values.projects
				self.userProjects = values.userProjects
				print("JSON : projects -> count = \(self.projects.count)")
				print("JSON : userProjects -> count = \(self.userProjects.count)")

			} catch let error {
				print("JSON Error -> \(error)")
			}

			}.resume()
	}
}



