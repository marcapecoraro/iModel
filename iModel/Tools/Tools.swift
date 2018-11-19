import UIKit

extension UITextField {

	func underlined(color: CGColor){
		let border = CALayer()
		let width = CGFloat(1.0)
		border.borderColor = color
		border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
		border.borderWidth = width
		self.layer.addSublayer(border)
		self.layer.masksToBounds = true
	}
}
