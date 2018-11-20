
import UIKit

class SignInVC: UIViewController {

	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var passwordConfirmTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.title = "S'inscrire"
		emailTextField.becomeFirstResponder()
		emailTextField.underlined(color: UIColor.lightGray.cgColor)
		passwordTextField.underlined(color: UIColor.lightGray.cgColor)
		passwordConfirmTextField.underlined(color: UIColor.lightGray.cgColor)
    }
}
