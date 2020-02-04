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
    
    let iconName: [String] = ["account","add-reminder","chat","doughnut","happy","man-money","pdf","sent","post","zip"]
    
    let colorArray: [UIColor] = [.blue, .red, .yellow, .orange, .cyan, .magenta, .purple]
    //中国色
    let ChineseColor: [String] = ["e3d600","008dd6","eea800","9f0082","e94c46","d20446","008b42","253893"]
    //夜景色 背景：423a57
    let NightViewColor: [String] = ["004f7a","7a8a92","fde5c5","dce5ec","9a7fb8","cd659f","829ac8","77c2b9"]
    //中世の街色　背景：d3d1bd
    let gamlaColor: [String] = ["f5e49e","ca9170","dec39c","d56950","4b4846","89a3d3","e0e565","d82630"]
    //夏祭り　背景：4e3d95
    let summerColor: [String] = ["3389ca","eaf4f9","E8473E","8ebbb1","d62e8a","e73462","00b8ee","fdf262"]
    //虹の色　背景： 000000
    let rainbowColor: [String] = ["e50011","ee7700","fff000","00a73b","0064b3","5f1885","2a2489","fefefe"]
    
    
    var btnArray: [UIButton] = []
    
    var btnTag = 0
    
    var tabHeight: CGFloat = 0.0
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    override func viewWillAppear(_ animated: Bool) {
        print("return")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabHeight = (tabBarController?.tabBar.frame.height)!
        
        //view.backgroundColor = UIColor(colorCode: "e13816")
        view.backgroundColor = UIColor(colorCode: "4e3d95")
        
        setButton()

        // Do any additional setup after loading the view.
    }
    
    func makeButton() {
        print("startmake")
        
        if addBtn {
            
            let random = CGFloat.random(in: 0 ..< 5)
            
            let makeBtn = UIButton()
            makeBtn.frame = CGRect(x: view.frame.width / 6 * random, y: 0, width: 75, height: 75)
            makeBtn.layer.cornerRadius = 10
            
            //アイコン色設定
            let colorRandom = Int(arc4random_uniform(8))
            makeBtn.backgroundColor = UIColor(colorCode: summerColor[colorRandom])
            
            //アイコン画像設定
            let iconRandom = Int(arc4random_uniform(10))
            makeBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            let iconImage = UIImage(named: iconName[iconRandom])?.withRenderingMode(.alwaysTemplate)
            makeBtn.setImage(iconImage, for: .normal)
            
            let iconColor = DecitionImageColor(UIColor(colorCode: summerColor[colorRandom]))
            makeBtn.tintColor = iconColor
            
            makeBtn.tag = btnTag
            btnTag += 1
            
            makeBtn.addTarget(self, action: #selector(tapButton), for: .touchDragExit)
            makeBtn.addTarget(self, action: #selector(nextView), for: .touchUpInside)
            
            view.addSubview(makeBtn)
            
            btnArray.append(makeBtn)
            
            makeGravity(sender: btnArray)
            
            addBtn = false
        }
    }
    
    func DecitionImageColor(_ color: UIColor) -> (UIColor) {
        let components = color.cgColor.components!
        let red = components[0] * 255
        let green = components[1] * 255
        let blue = components[2] * 255
        
        print("red \(red) green \(green) blue\(blue)")
        
        var color: UIColor = .black
        if ((red * 0.299 + green * 0.587 + blue * 0.114) < 128) {
            color = .white
        }
        
        return color
    }
    
    @objc func nextView(sender: UIButton) {
        let vc = MemoTextViewController()
        let color = sender.backgroundColor
        vc.backColor = color!
        
        present(vc, animated: true, completion: nil)
    }
    
    @objc func tapButton(sender: UIButton) {
        //let tag = sender.tag
        let num = btnArray.count
        
        for i in 0 ..< num {
            if sender == btnArray[i]  {
                btnArray.remove(at: i)
                break
            }
        }
        
        sender.removeFromSuperview()
        makeGravity(sender: btnArray)
    }
    
    
    func setButton() {
        

        
        
    }
    
    func makeGravity(sender: [UIButton]) {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior(items: sender)
        
        let collision = UICollisionBehavior(items: sender)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: CGRect(x: 0, y:view.frame.height - tabHeight, width: view.frame.width, height: tabHeight )
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
