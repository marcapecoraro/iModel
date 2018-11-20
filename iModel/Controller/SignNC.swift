import UIKit

class SignNC: UINavigationController, SignInSignUpVCDelegate {

	func showSignInVC() {
		performSegue(withIdentifier: "signinsegue", sender: self)
	}

	func showSignUpVC() {
		performSegue(withIdentifier: "signupsegue", sender: self)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		navigationBar.shadowImage = UIImage()
    }
}
