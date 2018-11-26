import UIKit

enum DetailProjectStoryboardId: String {
	case local = "detailprojectvc"
	case perspective = "perspectivepagevc"
}

class DetailProjectNC: UINavigationController {
	var currentLocal: Local?
	var currentPerspective: Perspective?
	var currentType: DetailProjectStoryboardId?

	override func viewDidLoad() {
		super.viewDidLoad()

		guard let identifier = currentType?.rawValue else { return }
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
		let vc = storyBoard.instantiateViewController(withIdentifier: identifier)
		self.pushViewController(vc, animated:true)

	}
}

extension DetailProjectNC: IModelVCDelegate {
	func sendLocal(_ local: Local) { currentLocal = local }
	func sendPerspective(_ perspective: Perspective) { currentPerspective = perspective	}
}
