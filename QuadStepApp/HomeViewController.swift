//
//  HomeViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var addBtn: Bool = false
    
    let colorArray: [UIColor] = [.blue, .red, .yellow, .orange, .cyan, .magenta, .purple]
    var btnArray: [UIButton] = []
    
    var tabHeight: CGFloat = 0.0
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    override func viewWillAppear(_ animated: Bool) {
        print("return")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabHeight = (tabBarController?.tabBar.frame.height)!
        
        view.backgroundColor = .white
        
        setButton()

        // Do any additional setup after loading the view.
    }
    
    func makeButton() {
        print("startmake")
        
        if addBtn {
            
            let random = CGFloat.random(in: 0 ..< 5)
            print(random)
            let colorRandom = Int(arc4random_uniform(7))
            
            let makeBtn = UIButton()
            makeBtn.frame = CGRect(x: view.frame.width / 6 * random, y: 0, width: 75, height: 75)
            makeBtn.layer.cornerRadius = 10
            makeBtn.backgroundColor = colorArray[colorRandom]
            
            view.addSubview(makeBtn)
            
            btnArray.append(makeBtn)
            
            makeGravity(sender: btnArray)
            
            addBtn = false
        }
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
        
        btnArray.append(testBtn)
        btnArray.append(secBtn)
        btnArray.append(thrBtn)
        
        makeGravity(sender: btnArray)
        
        
    }
    
    func makeGravity(sender: [UIButton]) {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior(items: sender)
        
        let collision = UICollisionBehavior(items: sender)
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
        //sender.frame.size = CGSize(width: 150, height: 150)
        //sender.layer.cornerRadius = 75
        print(addBtn)
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
