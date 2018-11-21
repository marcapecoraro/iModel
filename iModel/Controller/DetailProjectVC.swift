import UIKit

class DetailProjectVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var detailImageView: UIImageView!
	@IBOutlet weak var detailTableView: UITableView!

	override func viewDidLoad() {
        super.viewDidLoad()
		print("DetailProjectVC displayed with pin id:(X)")

		detailTableView.delegate = self
		detailTableView.dataSource = self
    }
}

//---TableView

extension DetailProjectVC {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		// create a new cell if needed or reuse an old one
		let cell:UITableViewCell = detailTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

		// set the text from the data model
		cell.textLabel?.text = "test"

		return cell
	}
}
