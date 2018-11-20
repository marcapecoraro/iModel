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

	@IBAction func connect(_ sender: Any) {
		DataUser.currentUser = UserBasic(id: 1, email: "marca.peco@gmail.com", firstname: "Marc-Antoine", lastname: "Pecoraro", telephone: "0699689968", location: "245 rue d'Arras, Biarritz")
	}
}
