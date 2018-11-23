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
		addModel()
		addPin()

		let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnNode(tap:)))
		sceneView.addGestureRecognizer(tap)
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
			scene.rootNode.addChildNode(PinNode(index: index, radius: 2, color: pinColor, position: pinPosition, type: .local))
		}

		guard let perspectives = DataUser.currentProject?.perspectives else { return }
		for (index, perspective) in perspectives.enumerated() {
			let pinPosition = SCNVector3(perspective.pin.position.x, perspective.pin.position.y, perspective.pin.position.z)
			let pinColor = UIColor(hexString: perspective.pin.color)!
			scene.rootNode.addChildNode(PinNode(index: index, radius: 2, color: pinColor, position: pinPosition, type: .perspective))
		}
	}

	func goDetailProjectNC(_ model: Any?) {
		guard let model = model else { return }
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
		let detailProjectNC = storyBoard.instantiateViewController(withIdentifier: "detailprojectnc") as! DetailProjectNC
		delegate = detailProjectNC
		if let local = model as? Local {
			delegate?.sendLocal(local)
			delegate?.currentType = .local
		}
		if let perspective = model as? Perspective {
			delegate?.sendPerspective(perspective)
			delegate?.currentType = .perspective
		}
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
					case let pinNode as PinNode where pinNode.type == .local :
						guard let local = DataUser.currentProject?.locals[pinNode.index] else { return }
						goDetailProjectNC(local)
					case let pinNode as PinNode where pinNode.type == .perspective :
						guard let perspective = DataUser.currentProject?.perspectives[pinNode.index] else { return }
						goDetailProjectNC(perspective)
				default:
					print("Unkown Nodes -> \(tappedNode!)")
					return
				}


			}
		}
	}
}
