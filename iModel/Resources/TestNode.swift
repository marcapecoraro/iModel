import SceneKit

class TestNode: SCNNode {
	override init() {
		super.init()

		self.geometry = SCNSphere(radius: 1.3)
		//self.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
		self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "Diffuse")
		self.geometry?.firstMaterial?.specular.contents = UIImage(named: "Specular")
		self.geometry?.firstMaterial?.emission.contents = UIImage(named: "Emission")
		self.geometry?.firstMaterial?.normal.contents = UIImage(named: "Normal")

		self.geometry?.firstMaterial?.shininess = 50

		let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 100), around: SCNVector3(0, 1, 0), duration: 10)
		let repeatAction = SCNAction.repeatForever(action)
		self.runAction(repeatAction)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
