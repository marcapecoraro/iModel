
import UIKit

class SignInSignUpVC: UIViewController {

	@IBOutlet weak var signInButton: UIButton!
	@IBOutlet weak var signUpButton: UIButton!
	@IBOutlet weak var skipButton: UIButton!

	override func viewDidLoad() {
        super.viewDidLoad()
    }


	@IBAction func signIn(_ sender: Any) {
		print("signIn")
	}

	@IBAction func signUp(_ sender: Any) {
		print("signUp")
	}

	@IBAction func skip(_ sender: Any) {
		print("skip")
	}

}
