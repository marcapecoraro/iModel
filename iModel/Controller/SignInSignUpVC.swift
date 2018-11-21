
import UIKit

protocol SignInSignUpVCDelegate: class {
	func showSignInVC()
	func showSignUpVC()
}

class SignInSignUpVC: UIViewController {

	weak var delegate: SignNC?

	@IBOutlet weak var signInButton: UIButton!
	@IBOutlet weak var signUpButton: UIButton!
	@IBOutlet weak var skipButton: UIButton!

	override func viewDidLoad() {
        super.viewDidLoad()
    }

	@IBAction func signIn(_ sender: Any) {
		delegate?.showSignInVC()
	}

	@IBAction func signUp(_ sender: Any) {
		delegate?.showSignUpVC()
	}

	@IBAction func skip(_ sender: Any) {
		print("skip")
	}

	override func prepare(for segue: UIStoryboardSegue,  sender: Any?) {
		if segue.identifier == "signnc" {
			let signNavigationCroller = segue.destination as! SignNC
			delegate = signNavigationCroller
		}
	}

}
