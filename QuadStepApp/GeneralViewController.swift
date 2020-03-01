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
    //var backColor: UIColor = .clear
    var backColor: String = "000000"
    
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
    
    let red: [String] = ["d7003a","e95464","b7282d","e94709","c82b55","e83f5f","932e44","ea5548","e9474d"]
    let orange: [String] = ["f08300","ed6d3d","ee7948","f6ad48","f7b977","efa718","f39800","fbd8b5","df6c31"]
    let yellow: [String] = ["ffd900","fcc800","f5e56b","d2b74e","f8b500","fff33f","fff2b8","ffdc00","fff262"]
    let yellowGreen: [String] = ["c8d921","c4c46a","afd147","d7cf3a","9d973b","c5de93","9dc04c","a7d28d","d9e367"]
    let green: [String] = ["007c45","4f8a5d","005842","67be8d","009854","00aa6e","98ce97","3ab483","258c6d"]
    let blueGreen: [String] = ["68b7a1","7ebeab","005243","7faba9","259f94","008969","005c4c","00a496","009aa3"]
    let aquaSky: [String] = ["bce2e8","a0d8ef","a2d7dd","89c3eb","83ccd2","64bcc7","00afcc","a0d8ea","6c9bd2"]
    let blue: [String] = ["239dda","2980af","1d50a2","007d8e","0068b7","008db7","00a0e9","3a8daa","26499d"]
    let indigo: [String] = ["0f5779","213a70","18448e","55576c","082752","1f2e55","006788","154577","001d42"]
    let violet: [String] = ["4e67b0","5654a2","706caa","bbbcde","51318f","4052a2","714f9d","c5b3d3","8e8bc2"]
    let magenta: [String] = ["895687","cc7db1","e95295","460d43","e55a9b","d1bada","d9aacd","e4007f","eb6e9f"]
    let pink: [String] = ["f09199","e7acb9","fef4f4","e94e66","f29c9f","f4ada3","fdeadf","da8d93","f5b090"]
    let brown: [String] = ["bf7834","814336","762e05","6f4d3e","965036","6f4e27","916f24","8e5e4a","612c16"]
    let blackWhite: [String] = ["2f2725","27120a","4b2d16","24130d","4e4449","fbfaf3","f8f5e3","fffffc","fbfdff"]
    let gold: [String] = ["e48e00","fabf13","f7dc8d","f8b856","fdd000","a36b21","d98032","c4972f","fdd75d"]
    let silver: [String] = ["949495","767676","7b8174","7a7c7d","afafb0","a99e93","ced1d3","c9c9c4","615f62"]
    var colorArray: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorArray = [red, orange, yellow, yellowGreen, green, blueGreen, aquaSky, blue, indigo, violet,
        magenta, pink, brown, blackWhite, gold, silver]
        
        print("General_did")

        height = view.frame.height
        width = view.frame.width
        
        generalView.frame = CGRect(x: 0, y: height / 10 * 3, width: width, height: height / 10 * 5)
        //generalView.backgroundColor = .orange
        view.addSubview(generalView)
    }
    
    func setParts() {
        let generalScroll = UIScrollView()
        generalScroll.frame = CGRect(x: 0, y: height / 10 * 8, width: width, height: height / 10)
        
        //背景色設定
        backGroundBtn.frame = CGRect(x: 0, y: 0, width: height / 10, height: height / 10)
        backGroundBtn.layer.cornerRadius = 10.0
        backGroundBtn.addTarget(self, action: #selector(setColor), for: .touchUpInside)
        backGroundBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        backGroundBtn.setImage(UIImage(named: "fill_100"), for: .normal)
        
        generalScroll.addSubview(backGroundBtn)
        
        //アイコンサイズ設定
        iconSizeBtn.frame = CGRect(x: width / 5, y: 0, width: height / 10, height: height / 10)
        iconSizeBtn.layer.cornerRadius = 10.0
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
    
    @objc func setColor() {
        
        removeSubviews(parentView: generalView)
        
        let btnWidth = generalView.frame.width / 9
        let btnHeight = generalView.frame.height / 7
        
        let colorScroll = UIScrollView()
        colorScroll.frame = CGRect(x: 0, y: 0, width: generalView.frame.width, height: generalView.frame.height)
        
        for i in 0 ..< colorArray.count {
            for j in 0 ..< 9 {
                let colorBtn = CustomUIButton()
                colorBtn.frame = CGRect(x: btnWidth * CGFloat(j), y: btnHeight * CGFloat(i), width: btnWidth, height: btnWidth)
                colorBtn.layer.cornerRadius = 1.0
                colorBtn.backgroundColor = UIColor(colorCode: colorArray[i][j])
                colorBtn.colorCode = colorArray[i][j]
                colorBtn.addTarget(self, action: #selector(tapColorButton), for: .touchUpInside)
                colorScroll.addSubview(colorBtn)
            }
        }
        colorScroll.contentSize = CGSize(width: generalView.frame.width, height: btnHeight * CGFloat(colorArray.count + 1))
        generalView.addSubview(colorScroll)
    }
    
    @objc func tapColorButton(_ sender: CustomUIButton) {
        print("change backColor")
        backColor = sender.colorCode!
        view.backgroundColor = UIColor(colorCode: backColor)
    }
    
    @objc func setBtnSize() {
        removeSubviews(parentView: generalView)
        
        btnSizeSlider.frame = CGRect(x: generalView.frame.width / 6, y: 0, width: generalView.frame.width / 3 * 2, height: generalView.frame.height)
        
        btnSizeSlider.backgroundColor = .clear
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
        
        let sValue = UIButton()
        sValue.frame = CGRect(x: generalView.frame.width / 6 * 1, y: 70, width: 20, height: 20)
        sValue.layer.cornerRadius = 5.0
        sValue.backgroundColor = .blue
        sValue.tag = 0
        sValue.addTarget(self, action: #selector(setSliderValue), for: .touchUpInside)
        
        
        let mValue = UIButton()
        mValue.frame = CGRect(x: generalView.frame.width / 6 * 3 - 20, y: 70, width: 20, height: 20)
        mValue.layer.cornerRadius = 5.0
        mValue.backgroundColor = .blue
        mValue.tag = 1
        mValue.addTarget(self, action: #selector(setSliderValue), for: .touchUpInside)
        
        
        let lValue = UIButton()
        lValue.frame = CGRect(x: generalView.frame.width / 6 * 5 - 20, y: 70, width: 20, height: 20)
        lValue.layer.cornerRadius = 5.0
        lValue.backgroundColor = .blue
        lValue.tag = 2
        lValue.addTarget(self, action: #selector(setSliderValue), for: .touchUpInside)
        
        
        generalView.addSubview(sliderValue)
        
        generalView.addSubview(btnSizeSlider)
        generalView.addSubview(sValue)
        generalView.addSubview(mValue)
        generalView.addSubview(lValue)
    }
    
    @objc func setSliderValue(_ sender: UIButton) {
        print("setValue")
        switch sender.tag {
        case 0:
            btnSizeSlider.value = Float(width / 7)
            middleBtn.frame.size = CGSize(width: width / 7, height: width / 7)
            sliderValue.text = String(btnSizeSlider.value)
            iconSize = width / 7
        case 1:
            btnSizeSlider.value = Float(width / 5)
            middleBtn.frame.size = CGSize(width: width / 5, height: width / 5)
            sliderValue.text = String(btnSizeSlider.value)
            iconSize = width / 5
        case 2:
            btnSizeSlider.value = Float(width / 4)
            middleBtn.frame.size = CGSize(width: width / 4, height: width / 4)
            sliderValue.text = String(btnSizeSlider.value)
            iconSize = width / 4
        default:
            print("error")
        }
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
        backColor = getData.2
        
        view.backgroundColor = UIColor(colorCode: backColor)
        
        setParts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        dataClass.putData(strFont: strFont, iconSize: iconSize, backColor: backColor)
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

