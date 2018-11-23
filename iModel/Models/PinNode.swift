import SceneKit

enum PinType {
	case local
	case perspective
}

class PinNode: SCNNode {
	var index: Int
	var type: PinType

	init(index: Int, radius: CGFloat, color: UIColor, position: SCNVector3, type: PinType) {
		self.index = index
		self.type = type
		super.init()
		let pin = SCNSphere(radius: radius)
		pin.firstMaterial?.diffuse.contents = color
		self.geometry = pin
		self.position = position
	}

	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
