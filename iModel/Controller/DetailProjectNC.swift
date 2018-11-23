import UIKit

class DetailProjectNC: UINavigationController {
	var currentLocal: Local?

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension DetailProjectNC: IModelVCDelegate {
	func sendLocal(_ local: Local) {
		currentLocal = local
	}
}
