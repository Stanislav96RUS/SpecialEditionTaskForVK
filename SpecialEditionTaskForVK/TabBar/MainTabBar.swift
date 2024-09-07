//
//  MainTabBar.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 04.09.2024.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTapBar()
        self.selectedIndex = 1
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    private func setupTapBar() {
        
        let oneHalfOfTheScreen = self.createNavigation(title: "", image: UIImage(systemName: "rectangle.portrait.tophalf.filled"), viewController: OneHalfOfTheScreen())
        let fullScreen = self.createNavigation(title: "", image: UIImage(systemName: "rectangle.portrait.inset.filled"), viewController: FullScreen())
        let oneEighthOfTheScreen = self.createNavigation(title: "", image: UIImage(systemName: "list.bullet.rectangle.portrait"), viewController: OneEighthOfTheScreen())
        self.setViewControllers([oneHalfOfTheScreen, fullScreen, oneEighthOfTheScreen], animated: true)
        
    }
    private func createNavigation(title: String, image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let navigationv = UINavigationController(rootViewController: viewController)
        navigationv.tabBarItem.title = title
        navigationv.tabBarItem.image = image
//        nav.viewControllers.first?.navigationItem.title = title + "Contr"
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        
        return navigationv
    }
}
