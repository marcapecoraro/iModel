import UIKit
import Foundation

class CellProject: UITableViewCell {
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var visualsImageView: UIImageView!
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var descriptLabel: UILabel!

	var cellProjectViewModel: CellProjectViewModel! {
		didSet {
			nameLabel.text = cellProjectViewModel.name
			locationLabel.text = cellProjectViewModel.location
			descriptLabel.text = cellProjectViewModel.descript
			visualsImageView.clipsToBounds = true
			
		}
	}
}
