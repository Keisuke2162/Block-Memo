//
//  HomeTabBarController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

//タブバーのクラス（SceneDelegateでrootViewに設定してる）
class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let dataClass = GeneralDataManagement()
    
    //HomeViewControllerのインスタンス
    let conHomeView = HomeViewController()

    private lazy var firstViewController: HomeViewController = {
        
        //conHomeView.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)
        let firstItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 1)
        firstItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        conHomeView.tabBarItem = firstItem
        //conHomeView.tabbarHeight = height
        return conHomeView
    }()
    
    let conGeneralView = GeneralViewController()

    private lazy var thirdViewController: GeneralViewController = {
        
        //conGeneralView.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 1)
        let thirdItem = UITabBarItem(title: "Setting", image: UIImage(named: "gear"), tag: 1)
        thirdItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        conGeneralView.tabBarItem = thirdItem

        return conGeneralView
    }()
    
    var height: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewControllers: [UIViewController] = [firstViewController, thirdViewController]
        
        setViewControllers(viewControllers, animated: false)
        
        let dataClass = GeneralDataManagement()
        let getData = dataClass.getData()
        conHomeView.fontType = getData.0
        conHomeView.iconSize = getData.1
        conHomeView.backColor = getData.2
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
                
        let tabBarHeight = self.tabBar.frame.height
        conHomeView.tabbarHeight = tabBarHeight
        let subBtnArray = conHomeView.btnArray
        conHomeView.makeGravity(sender: subBtnArray)
    }
}
