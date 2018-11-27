import UIKit

class AccountTableVC: UITableViewController {

	var data: [[String : Any]] = []
	let formatKeys = ["Email", "Prénom", "Nom", "Téléphone", "Adresse"]

    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.register(UINib(nibName: "CellAccount", bundle: nil), forCellReuseIdentifier: "cellaccount")

		//For V0
		DataUser.currentUser = UserBasic(id: 1, email: "marca.peco@gmail.com", firstname: "Marc-Antoine", lastname: "Pecoraro", telephone: "0699689968", location: "245 rue d'Arras, Biarritz")
		data = DataUser.currentUser!.getAllProperties()

		let statusBarView = UIView(frame: CGRect(x:0, y:0, width:view.frame.size.width, height: UIApplication.shared.statusBarFrame.height))
		statusBarView.backgroundColor=UIColor.white
		statusBarView.alpha = 1
		parent?.view.addSubview(statusBarView)

		tableView.tableFooterView = UIView(frame: .zero)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0: return data.count
		case 1: return 2
		default: return 0
		}
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "cellaccount", for: indexPath) as! CellAccount
			let cellAccountViewModel = CellAccountViewModel(key: formatKeys[indexPath.row], value: data[indexPath.row].first!.value as! String)
			cell.cellAccountViewModel = cellAccountViewModel
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "basiccellaccount", for: indexPath)
			cell.textLabel?.text = "Mon paramètre x"
			return cell
		default:
			return UITableViewCell()
		}
    }

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 55
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		var title = ""
		switch section {
		case 0: title = "Données"
		case 1: title = "Paramètres"
		default:
			return title
		}
		return title
	}

	override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		guard let header = view as? UITableViewHeaderFooterView else { return }
		header.textLabel?.textColor = UIColor.darkGray
		header.textLabel?.font = UIFont(name: "Avenir-medium", size: 16)
		header.textLabel?.frame = header.frame
		header.textLabel?.textAlignment = .left
	}
}
