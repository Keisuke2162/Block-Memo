//
//  GeneralViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
    
    var backGroundBtn = UIButton()  //
    var fontTypeBtn = UIButton()    //
    var fontSizeBtn = UIButton()    //
    var iconSizeBtn = UIButton()    //
    
    //
    let smallBtn = UIButton()
    let middleBtn = UIButton()
    let leargeBtn = UIButton()
    
    //重力設定とコリジョン設定
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    var testView = UIView()
    var backColor: UIColor = .clear
    
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    override func viewDidLoad() {
        height = view.frame.height
        width = view.frame.width
            
        super.viewDidLoad()
        
        backColor = .cyan
        self.view.backgroundColor = backColor
            
        setParts()
            
            
    }
    
    func setParts() {
        //背景色設定
        backGroundBtn.frame = CGRect(x: width / 5 * 2, y: height / 10 * 4, width: width / 5, height: width / 5)
        //backGroundBtn.center = view.center
        backGroundBtn.layer.cornerRadius = 10.0
        backGroundBtn.backgroundColor = .blue
        
        view.addSubview(backGroundBtn)
        
        //アイコンサイズ設定
        iconSizeBtn.frame = CGRect(x: width / 5, y: height / 10 * 4, width: width / 5, height: width / 5)
        iconSizeBtn.layer.cornerRadius = 10.0
        iconSizeBtn.backgroundColor = .red
        iconSizeBtn.addTarget(self, action: #selector(setButtonSize), for: .touchUpInside)
        
        view.addSubview(iconSizeBtn)
        
        //プレビューエリア
        testView.frame = CGRect(x: 0, y: 0, width: width, height: height / 3)
        testView.backgroundColor = .black
        
        view.addSubview(testView)
    }
    
    //ボタンサイズ設定を画面に表示
    @objc func setButtonSize() {
        var btnArray: [UIButton] = []
        
        
        smallBtn.frame = CGRect(x: width / 5, y: testView.frame.height / 2, width: width / 7, height: width / 7)
        smallBtn.backgroundColor = .orange
        smallBtn.layer.cornerRadius = 10.0
        btnArray.append(smallBtn)
        
        testView.addSubview(smallBtn)
        
        
        middleBtn.frame = CGRect(x: width / 5 * 2, y: testView.frame.height / 2, width: width / 5, height: width / 5)
        middleBtn.backgroundColor = .orange
        middleBtn.layer.cornerRadius = 10.0
        btnArray.append(middleBtn)
        
        testView.addSubview(middleBtn)
        
        
        leargeBtn.frame = CGRect(x: width / 5 * 3.5, y: testView.frame.height / 2, width: width / 4, height: width / 4)
        leargeBtn.backgroundColor = .orange
        leargeBtn.layer.cornerRadius = 10.0
        btnArray.append(leargeBtn)
        
        testView.addSubview(leargeBtn)
        
        makeGravity(sender: btnArray)
    }
    
    
    func makeGravity(sender: [UIButton]) {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior(items: sender)
        
        let collision = UICollisionBehavior(items: sender)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        //barrierは何の意味がある？
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: CGRect(x: 0, y: 0, width: view.frame.width, height: testView.frame.height )
        ))
        
        animator.addBehavior(collision)
        
        animator.addBehavior(gravity)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


