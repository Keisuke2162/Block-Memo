//
//  HomeTabBarController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

//タブバーのクラス（SceneDelegateでrootViewに設定してる）
class HomeTabBarController: UITabBarController, UITabBarControllerDelegate, MakeButtonActionDelegate {
    //HomeViewControllerのインスタンス
    let conHomeView = HomeViewController()
    
    //MenuModalViewで設定の入力完了ボタン押下で呼び出される
    //HomeViewControllerのボタン作成フラグを立ててボタン作成処理を起動
    func startMakeButton(title: String) {
        print("start")
        conHomeView.addBtn = true
        conHomeView.setTitle = title
        conHomeView.makeButton()
    }
    
    
    
    private lazy var firstViewController: HomeViewController = {
        
        conHomeView.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return conHomeView
    }()
    
    //真ん中のボタン
    private lazy var secondVCButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "add_s"), for: .normal)
        //button.sizeToFit()
        button.center.y = self.tabBar.center.y
        //button.translatesAutoresizingMaskIntoConstraints = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        self.tabBar.addSubview(button)
        //self.view.addSubview(button)
        return button
    }()

    let conGeneralView = GeneralViewController()

    private lazy var thirdViewController: GeneralViewController = {
        
        conGeneralView.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        /*
        conGeneralView.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "mail")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "text")?.withRenderingMode(.alwaysOriginal)
        )
        */
        return conGeneralView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewControllers: [UIViewController] = [firstViewController, thirdViewController]
        
        setViewControllers(viewControllers, animated: false)
        
        print("tabbar")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("return tabbar")
    }

    // SecondVCを表示するボタンの設定
    override func viewDidLayoutSubviews() {
        secondVCButton.frame.size = CGSize(width: tabBar.frame.width / 4, height: tabBar.frame.width / 4)
        secondVCButton.center.x = self.tabBar.center.x
        secondVCButton.center.y = tabBar.frame.height / 4
        //secondVCButton.sizeToFit()
        //secondVCButton.layer.cornerRadius = tabBar.frame.width / 15
        }

    // ボタンを押したときのアクション
    @objc func didTapButton(_ button: UIButton) {
        let con = MenuModalViewController()
        con.delegate = self
        present(con, animated: true, completion: nil)
    }
    
    
    /*
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
 */
}
