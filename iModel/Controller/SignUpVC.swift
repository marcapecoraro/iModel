import UIKit

class SignUpVC: UIViewController {

	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!

	override func viewDidLoad() {
        super.viewDidLoad()

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		navigationController?.navigationBar.shadowImage = UIImage()
		
		emailTextField.underlined(color: UIColor.lightGray.cgColor)
		passwordTextField.underlined(color: UIColor.lightGray.cgColor)

		emailTextField.becomeFirstResponder()
    }
}
