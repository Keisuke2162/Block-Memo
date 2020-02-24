//
//  HomeViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, MakeButtonActionDelegate, RemoveButtonActionDelegate {
    
    //アイコンの削除
    func removeIcon(removeID: String) {
        for v in view.subviews {
            if let v = v as? CustomUIButton, v.id == removeID {
                v.removeFromSuperview()
            }
        }
        
        let num = btnArray.count
        
        for i in 0 ..< num {
            if removeID == btnArray[i].id  {
                btnArray.remove(at: i)
                break
            }
        }
        makeGravity(sender: btnArray)
    }
    
    //アイコンの作成処理
    func startMakeButton(title: String, contentText: String, iconColor: UIColor, iconName: String) {
        addBtn = true
        setTitle = title
        setContentText = contentText
        setIconColor = iconColor
        iconString = iconName
        makeButton()
    }

    
    

    //設定データ読み込み用の変数
    let dataClass = GeneralDataManagement()
    var iconSize: CGFloat = 75.0
    var fontType: String = ""
    
    //画面下部のタブの高さ
    var tabbarHeight: CGFloat = 0.0
    
    //CoreDataからのデータ
    var homeDataArray: [HomeData] = []
    var homeData = HomeData()
    
    //TabBarから受け取るデータ
    var addBtn: Bool = false
    var setTitle: String = ""
    var setContentText: String = ""
    var setIconColor: UIColor = .white
    
    
    var iconString = "none_100"
    
    var btnArray: [CustomUIButton] = []
    
    var tabHeight: CGFloat = 0.0
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    //let iconName: [String] = ["account","add-reminder","chat","doughnut","happy","man-money","pdf","sent","post","zip"]
    
    //let colorArray: [UIColor] = [.blue, .red, .yellow, .orange, .cyan, .magenta, .purple]
    //中国色
    //let ChineseColor: [String] = ["e3d600","008dd6","eea800","9f0082","e94c46","d20446","008b42","253893"]
    //夜景色 背景：423a57
    //let NightViewColor: [String] = ["004f7a","7a8a92","fde5c5","dce5ec","9a7fb8","cd659f","829ac8","77c2b9"]
    //中世の街色　背景：d3d1bd
    //let gamlaColor: [String] = ["f5e49e","ca9170","dec39c","d56950","4b4846","89a3d3","e0e565","d82630"]
    //夏祭り　背景：4e3d95
    //let summerColor: [String] = ["3389ca","eaf4f9","E8473E","8ebbb1","d62e8a","e73462","00b8ee","fdf262"]
    //虹の色　背景： 000000
    //let rainbowColor: [String] = ["e50011","ee7700","fff000","00a73b","0064b3","5f1885","2a2489","fefefe"]
    //月景色　背景：3f83a6
    //let moonNightColor: [String] = ["002b40","d9e9e5","6cb2d3","1d4b69","b1c7d4","f4f2db","94a1a9","424f56"]
    
    override func viewDidAppear(_ animated: Bool) {
        let getData = dataClass.getData()
        fontType = getData.0
        iconSize = getData.1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabHeight = (tabBarController?.tabBar.frame.height)!
        
        //view.backgroundColor = UIColor(colorCode: "e13816")
        view.backgroundColor = .white
        
        //getData()
        
        setButton()

        // Do any additional setup after loading the view.
    }
    
    func makeButton() {
        print("startmake")
        
        if addBtn {
            
            let random = CGFloat.random(in: 0 ..< 5)
            
            //ボタン作成
            let makeBtn = CustomUIButton()
            makeBtn.frame = CGRect(x: view.frame.width / 6 * random, y: 0, width: iconSize, height: iconSize)
            makeBtn.layer.cornerRadius = 10
            
            let uuid: String = NSUUID().uuidString
            makeBtn.id = uuid
            makeBtn.title = setTitle
            makeBtn.text = setContentText
            
            //アイコン色設定
            makeBtn.backgroundColor = setIconColor
            
            //アイコン画像設定
            //let iconRandom = Int(arc4random_uniform(10))
            makeBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            let iconImage = UIImage(named: iconString)?.withRenderingMode(.alwaysTemplate)
            makeBtn.setImage(iconImage, for: .normal)
            
            //アイコンの線の色　白か黒か
            let iconColor = DecitionImageColor(setIconColor)
            makeBtn.tintColor = iconColor
            
            makeBtn.addTarget(self, action: #selector(nextView), for: .touchUpInside)
            
            view.addSubview(makeBtn)
            btnArray.append(makeBtn)
            
            makeGravity(sender: btnArray)
            
            addBtn = false
        }
    }
    //アイコンの色を白か黒か決める
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
    
    //表示画面への遷移
    @objc func nextView(sender: CustomUIButton) {
        let vc = MemoTextViewController()
        let color = sender.backgroundColor
        let tint = sender.tintColor
        print(sender.title!)
        
        vc.tintColor = tint!
        vc.backColor = color!
        vc.titleText = sender.title!
        vc.contentText = sender.text!
        vc.fontType = fontType
        vc.delegate = self
        vc.btnID = sender.id!
        
        present(vc, animated: true, completion: nil)
    }

    
    
    func setButton() {
        //btnArray初期化
        //CoreDataから読み込み
        //
        
        //追加ボタン
        let setBtn = CustomUIButton()
        setBtn.frame.size = CGSize(width: 75, height: 75)
        setBtn.center = CGPoint(x: view.center.x, y: view.center.y)
        setBtn.backgroundColor = view.backgroundColor
        setBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        setBtn.setImage(UIImage(named: "plus_100"), for: .normal)
        setBtn.layer.cornerRadius = 10.0
        setBtn.layer.borderWidth = 1.0
        setBtn.layer.borderColor = UIColor.black.cgColor
        setBtn.addTarget(self, action: #selector(openAddView), for: .touchUpInside)
        btnArray.append(setBtn)
        
        view.addSubview(setBtn)
        //必ずview.addSubviewが先
        makeGravity(sender: btnArray)
    }
    
    @objc func openAddView() {
        let con = MenuModalViewController()
        con.delegate = self
        
        present(con, animated: true, completion: nil)
    }
    
    func makeGravity(sender: [CustomUIButton]) {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior(items: sender)
        
        let collision = UICollisionBehavior(items: sender)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        /*
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: CGRect(x: 0, y:view.frame.height - tabHeight, width: view.frame.width, height: tabHeight )
        ))
        */
        print("tabbarheight\(tabbarHeight)")
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: CGRect(x: 0, y:0, width: view.frame.width, height: view.frame.height - tabbarHeight)
        ))
        
        
        animator.addBehavior(collision)
        
        animator.addBehavior(gravity)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
