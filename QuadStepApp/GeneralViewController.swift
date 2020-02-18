//
//  GeneralViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
    
    var generalView = UIView()
    
    var backGroundBtn = UIButton()  //背景色
    var fontTypeBtn = UIButton()    //フォント
    var fontSizeBtn = UIButton()    //文字サイズ
    var iconSizeBtn = UIButton()    //アイコンサイズ
    
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
    
    var colorCode: [String] = ["bce2e8","a0d8ef","a2d7dd","89c3eb","83ccd2","a0d8ea"]
    var color: [UIColor] = [.blue, .yellow, .orange, .red, .gray, .black]
    
    override func viewDidLoad() {
        height = view.frame.height
        width = view.frame.width
        
        generalView.frame = CGRect(x: 0, y: height / 10 * 3, width: width, height: height / 10 * 5)
        //generalView.backgroundColor = .orange
        view.addSubview(generalView)
            
        super.viewDidLoad()
        
        backColor = .cyan
        self.view.backgroundColor = backColor
            
        setParts()
    }
    
    func setParts() {
        let generalScroll = UIScrollView()
        generalScroll.frame = CGRect(x: 0, y: height / 10 * 8, width: width, height: height / 10)
        //generalScroll.backgroundColor = .black
        
        
        //背景色設定
        backGroundBtn.frame = CGRect(x: 0, y: 0, width: height / 10, height: height / 10)
        //backGroundBtn.center = view.center
        backGroundBtn.layer.cornerRadius = 10.0
        //backGroundBtn.backgroundColor = .blue
        backGroundBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        backGroundBtn.setImage(UIImage(named: "fill_100"), for: .normal)
        
        generalScroll.addSubview(backGroundBtn)
        
        //アイコンサイズ設定
        iconSizeBtn.frame = CGRect(x: width / 5, y: 0, width: height / 10, height: height / 10)
        iconSizeBtn.layer.cornerRadius = 10.0
        //iconSizeBtn.backgroundColor = .red
        iconSizeBtn.addTarget(self, action: #selector(setButtonSize), for: .touchUpInside)
        iconSizeBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        iconSizeBtn.setImage(UIImage(named: "size_100"), for: .normal)
        
        generalScroll.addSubview(iconSizeBtn)
        
        //フォント
        fontTypeBtn.frame = CGRect(x: width / 5 * 2, y: 0, width: height / 10, height: height / 10)
        fontTypeBtn.layer.cornerRadius = 10.0
        //fontTypeBtn.backgroundColor = .yellow
        fontTypeBtn.addTarget(self, action: #selector(setFontType), for: .touchUpInside)
        fontTypeBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        fontTypeBtn.setImage(UIImage(named: "font_90"), for: .normal)
        
        generalScroll.addSubview(fontTypeBtn)
        
        //プレビューエリア
        testView.frame = CGRect(x: 0, y: 0, width: width, height: height / 10 * 3)
        testView.backgroundColor = .black
        
        //generalScroll.contentSize = CGSize(width: width, height: height / 10)
        
        view.addSubview(testView)
        view.addSubview(generalScroll)
    }
    
    //ボタンサイズ設定画面
    @objc func setButtonSize() {
        var btnArray: [UIButton] = []
        
        smallBtn.frame = CGRect(x: width / 5, y: testView.frame.height / 2, width: width / 7, height: width / 7)
        smallBtn.backgroundColor = .orange
        smallBtn.layer.cornerRadius = 10.0
        smallBtn.addTarget(self, action: #selector(chooseSize), for: .touchUpInside)
        btnArray.append(smallBtn)
        
        testView.addSubview(smallBtn)
        
        
        middleBtn.frame = CGRect(x: width / 5 * 2, y: testView.frame.height / 2, width: width / 5, height: width / 5)
        middleBtn.backgroundColor = .orange
        middleBtn.layer.cornerRadius = 10.0
        middleBtn.addTarget(self, action: #selector(chooseSize), for: .touchUpInside)
        btnArray.append(middleBtn)
        
        testView.addSubview(middleBtn)
        
        leargeBtn.frame = CGRect(x: width / 5 * 3.25, y: testView.frame.height / 2, width: width / 4, height: width / 4)
        leargeBtn.backgroundColor = .orange
        leargeBtn.layer.cornerRadius = 10.0
        leargeBtn.addTarget(self, action: #selector(chooseSize), for: .touchUpInside)
        btnArray.append(leargeBtn)
        
        testView.addSubview(leargeBtn)
        
        makeGravity(sender: btnArray)
    }
    
    @objc func chooseSize(_ sender: UIButton) {
        smallBtn.backgroundColor = .orange
        middleBtn.backgroundColor = .orange
        leargeBtn.backgroundColor = .orange
        
        sender.backgroundColor = .blue
        
        //let length = sender.frame.height
    }
    
    let fontArray: [String] = ["Copperplate","Thonburi","CourierNewPSMT","Avenir-Book","Georgia",
                               "GurmukhiMN","DiwanMishafi","Futura-Medium","ArialHebrew","Optima-Italic",
                               "MalayalamSangamMN","AlNile","TrebuchetMS","Courier","OriyaSangamMN","ZapfDingbatsITC",
                                "Verdana","AmericanTypewriter","AvenirNext-Medium","Baskerville","KhmerSangamMN",
                                "Didot","SavoyeLetPlain","Symbol","Papyrus","PingFangSC-Thin","MyanmarSangamMN",
                                "EuphemiaUCAS"]
    //let fontArray: [String] = ["Copperplate","Thonburi","CourierNewPSMT","Avenir-Book"]
    
    @objc func setFontType() {
        let testMessage: String = "ABCDE"
        let fontScroll = UIScrollView()
        fontScroll.frame = CGRect(x: 0, y: 0, width: generalView.frame.width, height: generalView.frame.height)
        fontScroll.contentSize = CGSize(width: generalView.frame.width / 3 * CGFloat(fontArray.count / 2), height: generalView.frame.height)
        
        for i in 0 ..< fontArray.count {
            let xCount = i % (fontArray.count / 2)
            let yCount = i / (fontArray.count / 2)
            
            //4 q i/2 0 0 1 1
            //⏬名前変えたほうがいいかも（widthじゃなくてxPosとか）
            let btnWidth = generalView.frame.width / 3 * CGFloat(xCount)
            let btnHeight = fontScroll.frame.height / 2 * CGFloat(yCount)
            
            
            let fontBtn = UIButton()
            fontBtn.frame = CGRect(x:btnWidth, y: btnHeight, width: generalView.frame.width / 3, height: generalView.frame.height / 2)
            fontBtn.backgroundColor = .white
            fontBtn.setTitle(testMessage, for: .normal)
            fontBtn.titleLabel?.font = UIFont(name: fontArray[i], size: 25.0)
            fontBtn.setTitleColor(.black, for: .normal)
            
            fontScroll.addSubview(fontBtn)
        }
        
        generalView.addSubview(fontScroll)
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


