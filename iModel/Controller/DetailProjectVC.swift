import UIKit

class DetailProjectVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var detailImageView: UIImageView!
	@IBOutlet weak var detailTableView: UITableView!

	var local: Local?
	var data = [[String: Any]]()

	override func viewDidLoad() {
        super.viewDidLoad()
		detailTableView.delegate = self
		detailTableView.dataSource = self

		guard let detailProjectNC = navigationController as? DetailProjectNC else { return }
		guard let local = detailProjectNC.currentLocal else { return }
		data = local.getAllProperties()
    }
}

//---TableView

extension DetailProjectVC {


	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: UITableViewCell = detailTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

		cell.textLabel?.text = data[indexPath.row].first?.key
		cell.detailTextLabel?.text = data[indexPath.row].first?.value as? String

		return cell
	}
}
