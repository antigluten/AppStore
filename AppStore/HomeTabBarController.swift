//
//  HomeTabBarController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 21.06.2022.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .white
        searchViewController.navigationItem.title = "Search"
        
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        searchNavController.navigationBar.prefersLargeTitles = true
        searchNavController.tabBarItem.title = "Search"
        searchNavController.tabBarItem.image = UIImage(named: "search")
        
        let appsViewController = UIViewController()
        appsViewController.view.backgroundColor = .white
        appsViewController.navigationItem.title = "Apps"
        
        let appsNavController = UINavigationController(rootViewController: appsViewController)
        appsNavController.navigationBar.prefersLargeTitles = true
        appsNavController.tabBarItem.title = "Apps"
        appsNavController.tabBarItem.image = UIImage(named: "apps")
        
        
        let todayViewController = UIViewController()
        todayViewController.view.backgroundColor = .white
        todayViewController.navigationItem.title = "Today"
        
        let todayNavController = UINavigationController(rootViewController: todayViewController)
        todayNavController.navigationBar.prefersLargeTitles = true
        todayNavController.tabBarItem.title = "Today"
        todayNavController.tabBarItem.image = UIImage(named: "today_icon")
        
        viewControllers = [
            todayNavController,
            appsNavController,
            searchNavController
        ]
    }
}
