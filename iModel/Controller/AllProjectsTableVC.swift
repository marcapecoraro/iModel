import UIKit

class AllProjectsTableVC: UITableViewController {

	let dataModel = DataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.register(UINib(nibName: "CellProject", bundle: nil), forCellReuseIdentifier: "cellProject")
		tableView.separatorStyle = .none
    }

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataModel.projects.count
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellProject", for: indexPath) as! CellProject
		let cellProjectViewModel = CellProjectViewModel(project: dataModel.projects[indexPath.row])
		cell.cellProjectViewModel = cellProjectViewModel		

        return cell
    }

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 400
	}
}
