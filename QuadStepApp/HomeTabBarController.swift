//
//  HomeTabBarController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.delegate = self
        
        var viewControllers = [UIViewController]()
        
        let firstView = HomeViewController()
        firstView.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let secondView = GeneralViewController()
        secondView.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        let menuView = MenuModalViewController()
        menuView.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        
        viewControllers.append(firstView)
        viewControllers.append(menuView)
        viewControllers.append(secondView)
        
        self.viewControllers = viewControllers.map{
            UINavigationController(rootViewController: $0)
        }
        
        self.setViewControllers(viewControllers, animated: false)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is MenuModalViewController {
            if let currentVC = self.selectedViewController {
                let modalView = MenuModalViewController()
                //modalView.view.backgroundColor = .red
                //modalView.modalPresentationStyle = .overCurrentContext
                currentVC.present(modalView, animated: true, completion: nil)
            }
            return false
        }
        return true
    }
    
    
}
