import UIKit

class SignUpVC: UIViewController {

	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!

	override func viewDidLoad() {
        super.viewDidLoad()
		emailTextField.underlined(color: UIColor.lightGray.cgColor)
		passwordTextField.underlined(color: UIColor.lightGray.cgColor)

		emailTextField.becomeFirstResponder()
    }
}
