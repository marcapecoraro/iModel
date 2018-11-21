import SceneKit

class PinNode: SCNNode {
	var id: Int

	init(id: Int, radius: CGFloat, color: UIColor, position: SCNVector3) {
		self.id = id
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
