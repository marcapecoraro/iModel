import UIKit

class DetailProjectNC: UINavigationController, IModelVCDelegate {

	func sendLocal(local: Local) {
		currentLocal = local
	}

	var currentLocal: Local?

	override func viewDidLoad() {
		super.viewDidLoad()

		guard let local = currentLocal else {
			print("error local is nil ")
			return
		}
		print(local)
	}
}
