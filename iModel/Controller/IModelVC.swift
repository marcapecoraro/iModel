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
		lightNode.position = SCNVector3(0, 20, 60)
		scene.rootNode.addChildNode(lightNode)

		sceneView.scene = scene
		sceneView.showsStatistics = true
		sceneView.backgroundColor = UIColor.black
		sceneView.allowsCameraControl = true

		addModel()
		addPin()

		let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnNode(tap:)))
		sceneView.addGestureRecognizer(tap)
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
		guard let locals = DataUser.currentProject?.locals else { return }
		for local in locals {
			scene.rootNode.addChildNode(PinNode(id: local.id, radius: 3, color: .blue, position: SCNVector3(0, 10, -51)))
		}
		//scene.rootNode.addChildNode(PinNode(id: 1, radius: 3, color: .blue, position: SCNVector3(0, 10, -51)))
		//scene.rootNode.addChildNode(PinNode(id: 2, radius: 2, color: .green, position: SCNVector3(0, 20, -52)))
	}

	func goDetailProject() {
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
		let nextViewController = storyBoard.instantiateViewController(withIdentifier: "detailprojectnc") as! DetailProjectNC
		self.present(nextViewController, animated:true, completion:nil)
	}

	//Actions
	@objc func tapOnNode(tap: UITapGestureRecognizer){
		if tap.state == .ended {
			let location: CGPoint = tap.location(in: sceneView)
			let hits = sceneView.hitTest(location, options: nil)
			if !hits.isEmpty{
				let tappedNode = hits.first?.node
				switch tappedNode {
					case let tappedNode as PinNode:
						print("TAP pin \(tappedNode.id)")
						goDetailProject()
				default:
					print("Unkown Nodes -> \(tappedNode!)")
				}
			}
		}
	}
}
