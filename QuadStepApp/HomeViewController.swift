//
//  HomeViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tabHeight: CGFloat = 0.0
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabHeight = (tabBarController?.tabBar.frame.height)!
        
        view.backgroundColor = .white
        
        setButton()

        // Do any additional setup after loading the view.
    }
    
    func setButton() {
        let testBtn = UIButton()
        testBtn.frame = CGRect(x: view.center.x - 10, y: 0, width: 75, height: 75)
        testBtn.layer.cornerRadius = 10
        testBtn.backgroundColor = .yellow
        
        view.addSubview(testBtn)
        
        let secBtn = UIButton()
        secBtn.frame = CGRect(x: view.center.x - 75, y: 150, width: 75, height: 75)
        secBtn.layer.cornerRadius = 10
        secBtn.backgroundColor = .orange
        secBtn.addTarget(self, action: #selector(ChangeSize), for: .touchUpInside)
        
        view.addSubview(secBtn)
        
        let thrBtn = UIButton()
        thrBtn.frame = CGRect(x: view.center.x - 200, y: 150, width: 75, height: 75)
        thrBtn.layer.cornerRadius = 10
        thrBtn.backgroundColor = .blue
        
        view.addSubview(thrBtn)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior(items: [testBtn,secBtn,thrBtn])
        
        let collision = UICollisionBehavior(items: [testBtn,secBtn,thrBtn])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: CGRect(x: 0, y:view.frame.height - tabHeight, width: view.frame.width, height: tabHeight)
        ))
        
        
        animator.addBehavior(collision)
        
        animator.addBehavior(gravity)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func ChangeSize(_ sender: UIButton) {
        sender.frame.size = CGSize(width: 150, height: 150)
        sender.layer.cornerRadius = 75
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
