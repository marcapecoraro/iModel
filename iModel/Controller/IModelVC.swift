import UIKit
import SceneKit

class IModelVC : UIViewController {

	@IBOutlet weak var sceneView: SCNView!
	let scene = SCNScene()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		initScene()
	}

	func initScene() {
		let cameraNode = SCNNode()
		cameraNode.camera = SCNCamera()
		cameraNode.position = SCNVector3(0, 0, 30)
		scene.rootNode.addChildNode(cameraNode)

		let lightNode = SCNNode()
		lightNode.light = SCNLight()
		lightNode.light?.type = .omni
		lightNode.position = SCNVector3(0, 20, 40)
		scene.rootNode.addChildNode(lightNode)

		let box = SCNBox(width: 3, height: 3, length: 3, chamferRadius: 3)
		box.firstMaterial?.diffuse.contents = UIColor.red
		box.firstMaterial?.isDoubleSided = true
		let boxNode = SCNNode(geometry: box)
		boxNode.position = SCNVector3(0, -10, -45)
		scene.rootNode.addChildNode(boxNode)

		sceneView.scene = scene
		sceneView.showsStatistics = true
		sceneView.backgroundColor = UIColor.black
		sceneView.allowsCameraControl = true

		addNode()
	}

	func addNode() {
		if let filePath = Bundle.main.path(forResource: "stratocaster", ofType: "usdz", inDirectory: "Model.scnassets") {
			let referenceURL = URL(fileURLWithPath: filePath)
			let referenceNode = SCNReferenceNode(url: referenceURL)
			referenceNode?.load()
			referenceNode?.position = SCNVector3(0, -40, -60)
			scene.rootNode.addChildNode(referenceNode!)
		}
	}

}
