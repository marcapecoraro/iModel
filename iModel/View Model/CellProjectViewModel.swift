import Foundation

struct CellProjectViewModel {
	let name: String
	let location: String
	let descript: String

	init(project: Project) {
		self.name = project.name
		self.location = project.location
		self.descript = project.descript
	}
}
