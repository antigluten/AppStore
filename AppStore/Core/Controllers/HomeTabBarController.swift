//
//  HomeTabBarController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 21.06.2022.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    // MARK: - Internal
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        let appsPageController = createViewController(viewController: AppsPageController(), title: "Apps")
        
        if let vc = appsPageController as? AppsPageController {
            vc.manager = NetworkManager()
        }
        
        let navAppsPageController = createNavController(viewController: appsPageController, title: "Apps", imageName: "apps")
        
        viewControllers = [
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            navAppsPageController,
            createNavController(viewController: AppsSearchController(manager: NetworkManager(), imageLoader: ImageLoader()), title: "Search", imageName: "search")
        ]
    }
    
    // MARK: - Fileprivate
    // Is is like a factory method?
    fileprivate func createViewController(viewController: UIViewController, title: String) -> UIViewController {
        viewController.view.backgroundColor = .systemBackground
        viewController.navigationItem.title = title
        
        return viewController
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        viewController.view.backgroundColor = .systemBackground
        viewController.navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
}
