import Foundation
import UIKit

class PerspectivesPageVC: UIPageViewController, UIPageViewControllerDelegate {

	var perspective: Perspective?

	lazy var orderedViewControllers: [PerspectiveVC] = {
		guard let perspective = perspective else { return [] }
		guard perspective.img.count != 0 else { return [] }
		var perspectiveVC = [PerspectiveVC]()
		for img in perspective.img {
			perspectiveVC.append(self.getPerspectiveVC(withIdentifier: "perspectivevc", image: img))
		}
		return perspectiveVC
		}()

	override func viewDidLoad() {
		dataSource = self
		delegate   = self

		guard let detailProjectNC = navigationController as? DetailProjectNC else { return }
		guard let perspective = detailProjectNC.currentPerspective else { return }
		self.perspective = perspective

		guard let firstVC = orderedViewControllers.first else { return }
		setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
	}

	func getPerspectiveVC(withIdentifier identifier: String, image: String) -> PerspectiveVC {
		let perspectiveVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as! PerspectiveVC
		perspectiveVC.image = image
		return perspectiveVC
	}
}

extension PerspectivesPageVC: UIPageViewControllerDataSource
{
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let index = orderedViewControllers.index(of: viewController as! PerspectiveVC) else { return nil }
		let previousIndex = index - 1
		guard previousIndex >= 0 else { return orderedViewControllers.last }
		guard orderedViewControllers.count > previousIndex else { return nil }
		return orderedViewControllers[previousIndex]
	}

	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
	{
		guard let index = orderedViewControllers.index(of: viewController as! PerspectiveVC) else { return nil }
		let nextIndex = index + 1
		guard nextIndex < orderedViewControllers.count else { return orderedViewControllers.first }
		guard orderedViewControllers.count > nextIndex else { return nil }
		return orderedViewControllers[nextIndex]
	}
}
