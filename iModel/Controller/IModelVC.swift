import UIKit
import SceneKit

class IModelVC : UIViewController, PinNodeDelegate {

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
		lightNode.position = SCNVector3(0, 20, 60)
		scene.rootNode.addChildNode(lightNode)

		sceneView.scene = scene
		sceneView.showsStatistics = true
		sceneView.backgroundColor = UIColor.black
		sceneView.allowsCameraControl = true

		addModel()
		addPin()

		let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(rec:)))
		sceneView.addGestureRecognizer(tap)
	}

	@objc func handleTap(rec: UITapGestureRecognizer){
		if rec.state == .ended {
			let location: CGPoint = rec.location(in: sceneView)
			let hits = self.sceneView.hitTest(location, options: nil)
			if !hits.isEmpty{
				let tappedNode = hits.first?.node
				print("TAP \(tappedNode!)")
			}
		}
	}

	func addModel() {
		if let filePath = Bundle.main.path(forResource: "stratocaster", ofType: "usdz", inDirectory: "Model.scnassets") {
			let referenceURL = URL(fileURLWithPath: filePath)
			let referenceNode = SCNReferenceNode(url: referenceURL)
			referenceNode?.load()
			referenceNode?.position = SCNVector3(0, -40, -60)
			scene.rootNode.addChildNode(referenceNode!)
		}
	}

	func addPin() {
		let pinNode = PinNode()
		pinNode.delegate = self
		scene.rootNode.addChildNode(pinNode.create(radius: 3, color: .blue, position: SCNVector3(0, 10, -51)))
		scene.rootNode.addChildNode(pinNode.create(radius: 2, color: .green, position: SCNVector3(0, 20, -52)))
	}

	//PinNodeDelegate
	func touch(pin: PinNode) {
		print("touchPin")
	}

	

}
