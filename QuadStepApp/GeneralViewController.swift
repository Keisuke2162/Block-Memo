//
//  GeneralViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {

    var animator : UIDynamicAnimator!
        
        var gravity : UIGravityBehavior!
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            
            self.view.backgroundColor = UIColor.cyan
            
            // Labelを作成.
            let myLabel: UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 200,height: 40))
            myLabel.backgroundColor = UIColor.orange
            myLabel.layer.masksToBounds = true
            myLabel.layer.cornerRadius = 20.0
            myLabel.text = "Hello Swift!!"
            myLabel.textColor = UIColor.white
            myLabel.shadowColor = UIColor.gray
            myLabel.textAlignment = NSTextAlignment.center
            myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: -200)
            self.view.addSubview(myLabel)
            
            // Buttonを作成.
            let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
            myButton.layer.position = CGPoint(x: self.view.frame.midX, y: 500)
            myButton.layer.masksToBounds = true
            myButton.layer.cornerRadius = 20.0
            myButton.backgroundColor = UIColor.red
            myButton.addTarget(self, action: #selector(onClickMyButton), for: UIControl.Event.touchUpInside)
            self.view.addSubview(myButton)
            
            // UIDynamiAnimatorの生成とインスタンスの保存.
            animator = UIDynamicAnimator(referenceView: self.view)
            
            // 重量を作り、Viewに適用させる.
            gravity = UIGravityBehavior(items: [myLabel])
            
            // Collisionを作成、Viewに適用させる.
            let collision = UICollisionBehavior(items: [myLabel])
            
            // 透明な四角形の当たり判定を作る.
            collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect:
                CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: self.view.frame.maxX, height: 10))
            )
            
            // Collisionのアニメーションを実行.
            animator.addBehavior(collision)
        }
        
        @objc func onClickMyButton(sender : UIButton){
            
            // Gravityのアニメーションを実行.
            animator.addBehavior(gravity)
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


