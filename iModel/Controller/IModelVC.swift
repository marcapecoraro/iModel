import UIKit
import SceneKit

protocol IModelVCDelegate : class {
	func sendLocal(_ local: Local)
}

class IModelVC : UIViewController {

	@IBOutlet weak var sceneView: SCNView!
	let scene = SCNScene()
	weak var delegate: DetailProjectNC?

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
		for (index, local) in locals.enumerated() {
			let pinPosition = SCNVector3(local.pin.position.x, local.pin.position.y, local.pin.position.z)
			let pinColor = UIColor(hexString: local.pin.color)!
			scene.rootNode.addChildNode(PinNode(index: index, radius: 2, color: pinColor, position: pinPosition))
		}
	}

	func goDetailProject(_ local: Local) {
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
		let detailProjectNC = storyBoard.instantiateViewController(withIdentifier: "detailprojectnc") as! DetailProjectNC
		delegate = detailProjectNC
		delegate?.sendLocal(local)
		self.present(detailProjectNC, animated:true, completion:nil)
	}

	//Actions
	@objc func tapOnNode(tap: UITapGestureRecognizer){
		if tap.state == .ended {
			let location: CGPoint = tap.location(in: sceneView)
			let hits = sceneView.hitTest(location, options: nil)
			if !hits.isEmpty{
				let tappedNode = hits.first?.node
				switch tappedNode {
					case let pinNode as PinNode:
						guard let local = DataUser.currentProject?.locals[pinNode.index] else { return }
						goDetailProject(local)
				default:
					print("Unkown Nodes -> \(tappedNode!)")
				}
			}
		}
	}
}
