import UIKit

//Underline a textfield
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

//Convert hex color code to UIColor
extension UIColor {
	public convenience init?(hexString: String) {
		let r, g, b, a: CGFloat

		if hexString.hasPrefix("#") {
			let start = hexString.index(hexString.startIndex, offsetBy: 1)
			let hexColor = String(hexString[start...])

			if hexColor.count == 6 {
				let scanner = Scanner(string: hexColor)
				var hexNumber: UInt64 = 0

				if scanner.scanHexInt64(&hexNumber) {
					r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
					g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
					b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
					a = CGFloat(255)

					self.init(red: r, green: g, blue: b, alpha: a)
					return
				}
			}
		}

		return nil
	}
}
