//
//  UITabBarController.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        viewControllers = [
            createTabBarItem(tabBarTitle: "Posts", tabBarImage: "newspaper.fill", viewController: PostViewController()),
            createTabBarItem(tabBarTitle: "Users", tabBarImage: "person.fill", viewController: UsersViewController()),
            ]
    }
    
    func createTabBarItem(tabBarTitle: String, tabBarImage: String, viewController: UIViewController) -> UINavigationController {
        let navCont = UINavigationController(rootViewController: viewController)
        navCont.tabBarItem.title = tabBarTitle
        navCont.tabBarItem.image = UIImage(systemName: tabBarImage)
        return navCont
    }

    
}
