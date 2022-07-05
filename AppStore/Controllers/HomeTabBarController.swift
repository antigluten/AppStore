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
        
        viewControllers = [
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppsSearchController(manager: NetworkManager(), imageLoader: ImageLoader()), title: "Search", imageName: "search")
        ]
    }
    
    // MARK: - Fileprivate
    // Is is like a factory method?
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
