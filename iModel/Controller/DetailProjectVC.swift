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
		let cell: UITableViewCell = detailTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

		cell.textLabel?.text = "My Key detail"
		cell.detailTextLabel?.text = "My Value detail"

		return cell
	}
}
