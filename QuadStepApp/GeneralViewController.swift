//
//  GeneralViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
    
    //User Defaultから取得　＆　UserDefaultに保存する値
    var strFont: String = ""
    var iconSize: CGFloat = 0.0
    
    
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
    let fontArray: [String] = ["Copperplate","Thonburi","CourierNewPSMT","Avenir-Book","Georgia",
                               "GurmukhiMN","DiwanMishafi","Futura-Medium","ArialHebrew","Optima-Italic",
                               "MalayalamSangamMN","AlNile","TrebuchetMS","Courier","OriyaSangamMN","ZapfDingbatsITC",
                                "Verdana","AmericanTypewriter","AvenirNext-Medium","Baskerville","KhmerSangamMN",
                                "Didot","SavoyeLetPlain","Symbol","Papyrus","PingFangSC-Thin","MyanmarSangamMN",
                                "EuphemiaUCAS"]
    
    //font一覧表示用
    let fontScroll = UIScrollView()
    var fontBtnArray: [UIButton] = []
    
    //プレビューボタン用格納配列
    var btnArray: [UIButton] = []
    
    //ボタンサイズ用スライダー
    let btnSizeSlider = UISlider()
    let sliderValue = UILabel() //スライダーの値表示用ラベル
    
    
    override func viewDidLoad() {
        print("General_did")

        
        height = view.frame.height
        width = view.frame.width
        
        generalView.frame = CGRect(x: 0, y: height / 10 * 3, width: width, height: height / 10 * 5)
        //generalView.backgroundColor = .orange
        view.addSubview(generalView)
            
        super.viewDidLoad()
        
        backColor = .cyan
        self.view.backgroundColor = backColor
            
        
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
        iconSizeBtn.addTarget(self, action: #selector(setBtnSize), for: .touchUpInside)
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
        
        view.addSubview(testView)
        view.addSubview(generalScroll)
        
        //プレビューボタン
        middleBtn.frame.size = CGSize(width: iconSize, height: iconSize)
        middleBtn.center = CGPoint(x: testView.center.x, y: testView.center.y)
        middleBtn.backgroundColor = .orange
        middleBtn.layer.cornerRadius = 10.0
        btnArray.append(middleBtn)
        testView.addSubview(middleBtn)
        
        makeGravity(sender: btnArray)
    }
    
    @objc func setBtnSize() {
        removeSubviews(parentView: generalView)
        
        btnSizeSlider.frame = CGRect(x: generalView.frame.width / 6, y: 0, width: generalView.frame.width / 3 * 2, height: generalView.frame.height)
        
        btnSizeSlider.backgroundColor = .clear
        //btnSizeSlider.layer.shadowOpacity = 0.5
        btnSizeSlider.layer.masksToBounds = false
        //スライダーを動かした時の処理
        btnSizeSlider.addTarget(self, action: #selector(moveSlider), for: .valueChanged)
        //スライダーを動かし終わったときの処理
        btnSizeSlider.addTarget(self, action: #selector(decSize), for: .touchUpInside)
        
        let minSize = width / 7
        let maxSize = width / 4
        btnSizeSlider.minimumValue = Float(minSize)
        btnSizeSlider.maximumValue = Float(maxSize)
        btnSizeSlider.value = Float(iconSize)
        
        sliderValue.frame = CGRect(x: generalView.frame.width / 2 - 60, y: 20, width: 120, height: 20)
        sliderValue.text = String(btnSizeSlider.value)
        
        generalView.addSubview(sliderValue)
        
        generalView.addSubview(btnSizeSlider)
    }
    
    @objc func moveSlider(_ sender: UISlider) {
        let size = CGFloat(sender.value)
        middleBtn.frame.size = CGSize(width: size, height: size)
        sliderValue.text = String(btnSizeSlider.value)
    }
    
    @objc func decSize(_ sender: UISlider) {
        let size = CGFloat(sender.value)
        iconSize = size
        middleBtn.center = CGPoint(x: testView.center.x, y: testView.center.y)
    }
    
    //font選択ボタン
    @objc func setFontType() {
        fontBtnArray.removeAll()
        removeSubviews(parentView: generalView)
        let testMessage: String = "ABCDE"
        
        fontScroll.frame = CGRect(x: 0, y: 0, width: generalView.frame.width, height: generalView.frame.height)
        fontScroll.contentSize = CGSize(width: generalView.frame.width / 3 * CGFloat(fontArray.count / 2), height: generalView.frame.height)
        
        for i in 0 ..< fontArray.count {
            let xCount = i % (fontArray.count / 2)
            let yCount = i / (fontArray.count / 2)
            //⏬名前変えたほうがいいかも（widthじゃなくてxPosとか）
            let btnWidth = generalView.frame.width / 3 * CGFloat(xCount)
            let btnHeight = fontScroll.frame.height / 2 * CGFloat(yCount)
            
            //フォント選択ボタンの設定
            let fontBtn = UIButton()
            fontBtn.frame = CGRect(x:btnWidth, y: btnHeight, width: generalView.frame.width / 3, height: generalView.frame.height / 2)
            fontBtn.backgroundColor = .white
            fontBtn.setTitle(testMessage, for: .normal)
            fontBtn.titleLabel?.font = UIFont(name: fontArray[i], size: 25.0)
            fontBtn.setTitleColor(.black, for: .normal)
            fontBtn.tag = i
            fontBtn.addTarget(self, action: #selector(chooseFont), for: .touchUpInside)
            
            if strFont == fontArray[i] {
                fontBtn.layer.borderWidth = 2.0
                fontBtn.layer.borderColor = UIColor.black.cgColor
            }
            
            fontBtnArray.append(fontBtn)
            fontScroll.addSubview(fontBtn)
        }
        generalView.addSubview(fontScroll)
    }
    
    @objc func chooseFont(_ sender: UIButton) {
        for i in 0 ..< fontBtnArray.count {
            fontBtnArray[i].layer.borderWidth = 0.0
        }
        
        sender.layer.borderWidth = 2.0
        sender.layer.borderColor = UIColor.black.cgColor
        strFont = fontArray[sender.tag]
    }
    
    //重力作成
    func makeGravity(sender: [UIButton]) {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior(items: sender)
        
        let collision = UICollisionBehavior(items: sender)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        //barrierは何の意味がある？
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: CGRect(x: 0, y: 0, width: view.frame.width, height: testView.frame.height - 50)
        ))
        
        animator.addBehavior(collision)
        
        animator.addBehavior(gravity)
    }
    
    func removeSubviews(parentView: UIView) {
        let subviews = parentView.subviews
        for sub in subviews {
            sub.removeFromSuperview()
        }
    }

    let dataClass = GeneralDataManagement()
    
    override func viewWillAppear(_ animated: Bool) {
        let getData = dataClass.getData()
        strFont = getData.0
        iconSize = getData.1
        
        setParts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        dataClass.putData(strFont: strFont, iconSize: iconSize)
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

