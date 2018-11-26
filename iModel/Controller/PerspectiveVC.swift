import UIKit
import Alamofire
import AlamofireImage

class PerspectiveVC: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	var image = ""

    override func viewDidLoad() {
		
        super.viewDidLoad()

		let remoteImageURL = URL(string: image)!
		Alamofire.request(remoteImageURL).responseData { (response) in
			if response.error == nil {
				print("ALAMOFIRE :  load image --> \(response.result)")
				// Show the downloaded image:
				if let data = response.data {
					self.imageView.image = UIImage(data: data)
				}
			}
		}
    }

	@IBAction func back(_ sender: UIBarButtonItem) {
		navigationController?.dismiss(animated: true, completion: { })
	}
}
