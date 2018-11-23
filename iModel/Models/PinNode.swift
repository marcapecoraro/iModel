import SceneKit

class PinNode: SCNNode {
	var index: Int

	init(index: Int, radius: CGFloat, color: UIColor, position: SCNVector3) {
		self.index = index
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
