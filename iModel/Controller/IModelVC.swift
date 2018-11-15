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
		cameraNode.position = SCNVector3(0, 0, 5)
		scene.rootNode.addChildNode(cameraNode)

		let lightNode = SCNNode()
		lightNode.light = SCNLight()
		lightNode.light?.type = .omni
		lightNode.position = SCNVector3(0, 10, 2)
		scene.rootNode.addChildNode(lightNode)

		sceneView.scene = scene
		sceneView.showsStatistics = true
		sceneView.backgroundColor = UIColor.black
		sceneView.allowsCameraControl = true

		addNode()
	}

	func addNode() {
		//let testNode = TestNode()
		//scene.rootNode.addChildNode(testNode)

		if let filePath = Bundle.main.path(forResource: "stratocaster", ofType: "usdz", inDirectory: "Model.scnassets") {
			let referenceURL = URL(fileURLWithPath: filePath)
			let referenceNode = SCNReferenceNode(url: referenceURL)
			referenceNode?.load()
			referenceNode?.position = SCNVector3(0, -40, -60)
			scene.rootNode.addChildNode(referenceNode!)
		}
	}

}
