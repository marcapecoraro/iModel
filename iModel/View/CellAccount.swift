import Foundation
import UIKit

class CellAccount: UITableViewCell {

	@IBOutlet weak var keyLabel: UILabel!
	@IBOutlet weak var valueLabel: UILabel!

	var cellAccountViewModel: CellAccountViewModel! {
		didSet {
			keyLabel.text = cellAccountViewModel.key
			valueLabel.text = cellAccountViewModel.value
		}
	}
}
