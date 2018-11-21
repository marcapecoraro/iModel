import Foundation
import SceneKit

protocol PinNodeDelegate: class {
	func touch(pin: PinNode)
}

class PinNode: SCNNode {
	weak var delegate: PinNodeDelegate!

	func create(radius: CGFloat, color: UIColor, position: SCNVector3) -> SCNNode {
		let pin = SCNSphere(radius: radius)
		pin.firstMaterial?.diffuse.contents = color
		let pinNode = SCNNode(geometry: pin)
		pinNode.position = position

		return pinNode
	}

	func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.delegate?.touch(pin: self)
	}
}
