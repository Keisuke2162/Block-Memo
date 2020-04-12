//
//  GeneralViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController, UIFontPickerViewControllerDelegate {
    
    
    //User Defaultから取得　＆　UserDefaultに保存する値
    var strFont: String = ""
    var iconSize: CGFloat = 0.0
    var fontSize: CGFloat = 0.0
    
    var tintColor: UIColor = .white
    
    //tabbarの高さ
    var tabbarHeight: CGFloat = 0.0
    
    
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
    
    let red: [String] = ["ea5548", "e95464", "e9474d", "e94709", "e83f5f", "d7003a", "c82b55", "b7282d", "932e44"]
    let orange: [String] = ["fbd8b5", "f7b977", "f6ad48", "f39800", "f08300", "efa718", "ee7948", "ed6d3d", "df6c31"]
    let yellow: [String] = ["fff33f", "fff2b8", "fff262", "ffdc00", "ffd900", "fcc800", "f8b500", "f5e56b", "d2b74e"]
    let yellowGreen: [String] = ["d9e367", "d7cf3a", "c8d921", "c5de93", "c4c46a", "afd147", "a7d28d", "9dc04c", "9d973b"]
    let green: [String] = ["98ce97", "67be8d", "4f8a5d", "3ab483", "258c6d", "00aa6e", "009854", "007c45", "005842"]
    let blueGreen: [String] = ["7faba9", "7ebeab", "68b7a1", "259f94", "00a496", "009aa3", "008969", "005c4c", "005243"]
    let aquaSky: [String] = ["bce2e8", "a2d7dd", "a0d8ef", "a0d8ea", "89c3eb", "83ccd2", "6c9bd2", "64bcc7", "00afcc"]
    let blue: [String] = ["3a8daa", "2980af", "26499d", "239dda", "1d50a2", "00a0e9", "008db7", "007d8e", "0068b7"]
    let indigo: [String] = ["55576c", "213a70", "1f2e55", "18448e", "154577", "0f5779", "082752", "006788", "001d42"]
    let violet: [String] = ["c5b3d3", "bbbcde", "8e8bc2", "714f9d", "706caa", "5654a2", "51318f", "4e67b0", "4052a2"]
    let magenta: [String] = ["eb6e9f", "e95295", "e55a9b", "e4007f", "d9aacd", "d1bada", "cc7db1", "895687", "460d43"]
    let pink: [String] = ["fef4f4", "fdeadf", "f5b090", "f4ada3", "f29c9f", "f09199", "e94e66", "e7acb9", "da8d93"]
    let brown: [String] = ["bf7834", "965036", "916f24", "8e5e4a", "814336", "762e05", "6f4e27", "6f4d3e", "612c16"]
    let blackWhite: [String] = ["fffffc", "fbfdff", "fbfaf3", "f8f5e3", "4e4449", "4b2d16", "2f2725", "27120a", "24130d"]
    let gold: [String] = ["fdd75d", "fdd000", "fabf13", "f8b856", "f7dc8d", "e48e00", "d98032", "c4972f", "a36b21"]
    let silver: [String] = ["ced1d3", "c9c9c4", "afafb0", "a99e93", "949495", "7b8174", "7a7c7d", "767676", "615f62"]

    var colorArray: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorArray = [red, orange, yellow, yellowGreen, green, blueGreen, aquaSky, blue, indigo, violet,
        magenta, pink, brown, blackWhite, gold, silver]
        
        print("General_did")

        height = view.frame.height
        width = view.frame.width
        
        generalView.frame = CGRect(x: 0, y:0, width: width, height: height / 10 * 8)
        view.addSubview(generalView)
    }
    
    let masterBlockBtn = UIButton()
    
    func setParts() {
        let generalScroll = UIScrollView()
        generalScroll.frame = CGRect(x: 0, y: height - tabbarHeight - 80, width: width, height: 80)
        
        tintColor = DecitionImageColor(view.backgroundColor!)
        
        //背景色設定ボタン
        backGroundBtn.frame.size = CGSize(width: 70, height: 70)
        backGroundBtn.center = CGPoint(x: width / 5 , y: 35)
        backGroundBtn.layer.cornerRadius = 10.0
        backGroundBtn.addTarget(self, action: #selector(setColor), for: .touchUpInside)
        backGroundBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let backGroundImg = UIImage(named: "fill_100")?.withRenderingMode(.alwaysTemplate)
        backGroundBtn.setImage(backGroundImg, for: .normal)
        backGroundBtn.tintColor =  tintColor
        
        generalScroll.addSubview(backGroundBtn)
        
        //アイコンサイズ設定ボタン
        iconSizeBtn.frame.size = CGSize(width: 70, height: 70)
        iconSizeBtn.center = CGPoint(x: width / 2 , y: 35)
        //iconSizeBtn.frame = CGRect(x: 80, y: 0, width: 70, height: 70)
        iconSizeBtn.layer.cornerRadius = 10.0
        iconSizeBtn.addTarget(self, action: #selector(setBtnSize), for: .touchUpInside)
        iconSizeBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let iconSizeImg = UIImage(named: "size_100")?.withRenderingMode(.alwaysTemplate)
        iconSizeBtn.setImage(iconSizeImg, for: .normal)
        iconSizeBtn.tintColor =  tintColor
        
        generalScroll.addSubview(iconSizeBtn)
        
        //フォント設定ボタン
        fontTypeBtn.frame.size = CGSize(width: 70, height: 70)
        fontTypeBtn.center = CGPoint(x: width / 5 * 4 , y: 35)
        //fontTypeBtn.frame = CGRect(x: 160, y: 0, width: 70, height: 70)
        fontTypeBtn.layer.cornerRadius = 10.0
        fontTypeBtn.addTarget(self, action: #selector(setFontType), for: .touchUpInside)
        fontTypeBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let fontTypeImg = UIImage(named: "font_90")?.withRenderingMode(.alwaysTemplate)
        fontTypeBtn.setImage(fontTypeImg, for: .normal)
        fontTypeBtn.tintColor =  tintColor
        
        generalScroll.addSubview(fontTypeBtn)
        
        view.addSubview(generalScroll)

    }
    
    let masterBlockName = ["add","wordSearch","voice"]
    
    let addBtn = UIButton()
    let searchBtn = UIButton()
    let viewBtn = UIButton()
    var masterButtonArray: [UIButton] = []
    
    let addFlg = false
    let searchFlg = false
    let viewerFlg = false
    
    
    
    @objc func setMasterBlock(){
        removeSubviews(parentView: generalView)
        
        //add
        addBtn.frame.size = CGSize(width: width / 7, height: width / 7)
        addBtn.center = CGPoint(x: width / 7, y: height / 10 * 2)
        let btnImage = UIImage(named: "plus_100")?.withRenderingMode(.alwaysTemplate)
        addBtn.tintColor = .black
        addBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        addBtn.layer.cornerRadius = 10.0
        addBtn.setImage(btnImage, for: .normal)
        addBtn.backgroundColor = .white
        masterButtonArray.append(addBtn)
        
        //search
        
        searchBtn.frame.size = CGSize(width: width / 7, height: width / 7)
        searchBtn.center = CGPoint(x: width / 7 * 3.5, y: height / 10 * 2)
        let searchImage = UIImage(named: "search_100")?.withRenderingMode(.alwaysTemplate)
        searchBtn.tintColor = .black
        searchBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        searchBtn.layer.cornerRadius = 10.0
        searchBtn.setImage(searchImage, for: .normal)
        searchBtn.backgroundColor = .white
        masterButtonArray.append(searchBtn)
        
        //viewer
        
        viewBtn.frame.size = CGSize(width: width / 7, height: width / 7)
        viewBtn.center = CGPoint(x: width / 7 * 6, y: height / 10 * 2)
        let viewerImage = UIImage(named: "view_100")?.withRenderingMode(.alwaysTemplate)
        viewBtn.tintColor = .black
        viewBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        viewBtn.layer.cornerRadius = 10.0
        viewBtn.setImage(viewerImage, for: .normal)
        viewBtn.backgroundColor = .white
        masterButtonArray.append(viewBtn)
        
        generalView.addSubview(addBtn)
        generalView.addSubview(searchBtn)
        generalView.addSubview(viewBtn)
    }
    
    //*****************************************************************************
    @objc func setColor(){
        
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
        tintColor = DecitionImageColor(UIColor(colorCode: backColor))
        backGroundBtn.tintColor = tintColor
        iconSizeBtn.tintColor = tintColor
        fontTypeBtn.tintColor = tintColor
    }
    
    let previewBtn = UIButton()
    var size: CGFloat = 0.0
    
    
    //********************************************************************************
    @objc func setBtnSize() {
        removeSubviews(parentView: generalView)
        
        //btnSizeSlider.frame = CGRect(x: generalView.frame.width / 6, y: 0, width: generalView.frame.width / 3 * 2, height: generalView.frame.height)
        btnSizeSlider.frame.size = CGSize(width: width / 4 * 3, height: 50)
        btnSizeSlider.center = CGPoint(x: width / 2, y: generalView.frame.height - 50)
        
        btnSizeSlider.backgroundColor = .clear
        btnSizeSlider.layer.masksToBounds = false
        //スライダーを動かした時の処理
        btnSizeSlider.addTarget(self, action: #selector(moveSlider), for: .valueChanged)
        //スライダーを動かし終わったときの処理
        btnSizeSlider.addTarget(self, action: #selector(decSize), for: .touchUpInside)
        
        //let minSize = width / 8
        //let maxSize = width / 5
        let minSize = 50
        let maxSize = 100
        btnSizeSlider.minimumValue = Float(minSize)
        btnSizeSlider.maximumValue = Float(maxSize)
        btnSizeSlider.value = Float(iconSize)
        
        sliderValue.frame.size = CGSize(width: 120, height: 20)
        sliderValue.center = CGPoint(x: width / 2, y: generalView.frame.height - 200)
        sliderValue.textAlignment = .center
        sliderValue.text = String(Int(btnSizeSlider.value))
        sliderValue.textColor = tintColor
        
        let sValue = UIButton()
        sValue.frame = CGRect(x: generalView.frame.width / 6 * 1, y: generalView.frame.height - 150, width: 20, height: 20)
        sValue.layer.cornerRadius = 5.0
        sValue.backgroundColor = tintColor
        sValue.tag = 0
        sValue.addTarget(self, action: #selector(setSliderValue), for: .touchUpInside)
        
        let mValue = UIButton()
        mValue.frame = CGRect(x: generalView.frame.width / 2, y: generalView.frame.height - 150, width: 20, height: 20)
        mValue.layer.cornerRadius = 5.0
        mValue.backgroundColor = tintColor
        mValue.tag = 1
        mValue.addTarget(self, action: #selector(setSliderValue), for: .touchUpInside)
        
        let lValue = UIButton()
        lValue.frame = CGRect(x: generalView.frame.width / 6 * 5 - 20, y: generalView.frame.height - 150, width: 20, height: 20)
        lValue.layer.cornerRadius = 5.0
        lValue.backgroundColor = tintColor
        lValue.tag = 2
        lValue.addTarget(self, action: #selector(setSliderValue), for: .touchUpInside)
        
        
        previewBtn.frame.size = CGSize(width: iconSize, height: iconSize)
        previewBtn.center = CGPoint(x: width / 2, y: generalView.frame.height / 3)
        previewBtn.backgroundColor = tintColor
        let image = UIImage(named: "kodi")?.withRenderingMode(.alwaysTemplate)
        previewBtn.imageEdgeInsets = UIEdgeInsets(top: iconSize / 3.5, left: iconSize / 3.5, bottom: iconSize / 3.5, right: iconSize / 3.5)
        previewBtn.tintColor = UIColor(colorCode: backColor)
        previewBtn.setImage(image, for: .normal)
        previewBtn.layer.cornerRadius = 10.0
        
        generalView.addSubview(sliderValue)
        
        generalView.addSubview(btnSizeSlider)
        generalView.addSubview(sValue)
        generalView.addSubview(mValue)
        generalView.addSubview(lValue)
        generalView.addSubview(previewBtn)
    }
    
    @objc func setSliderValue(_ sender: UIButton) {
        print("setValue")
        switch sender.tag {
        case 0:
            btnSizeSlider.value = Float(50)
            iconSize = 50
        case 1:
            btnSizeSlider.value = Float(75)
            previewBtn.frame.size = CGSize(width: 75, height: 75)
            iconSize = 75
        case 2:
            btnSizeSlider.value = Float(100)
            previewBtn.frame.size = CGSize(width: 100, height: 100)
            iconSize = 100
        default:
            print("error")
        }
        size = CGFloat(btnSizeSlider.value)
        sliderValue.text = String(Int(btnSizeSlider.value))
        previewBtn.imageEdgeInsets = UIEdgeInsets(top: size / 3.5, left: size / 3.5, bottom: size / 3.5, right: size / 3.5)
        previewBtn.frame.size = CGSize(width: size, height: size)
        previewBtn.center = CGPoint(x: width / 2, y: generalView.frame.height / 3)
    }
    
    @objc func moveSlider(_ sender: UISlider) {
        size = CGFloat(sender.value)
        previewBtn.imageEdgeInsets = UIEdgeInsets(top: size / 3.5, left: size / 3.5, bottom: size / 3.5, right: size / 3.5)
        previewBtn.frame.size = CGSize(width: size, height: size)
        previewBtn.center = CGPoint(x: width / 2, y: generalView.frame.height / 3)
        
        //middleBtn.frame.size = CGSize(width: size, height: size)
        sliderValue.text = String(Int(btnSizeSlider.value))
    }
    
    @objc func decSize(_ sender: UISlider) {
        let size = CGFloat(sender.value)
        iconSize = size
    }
    //**************************************************************************************
    
    let fontLabel = UILabel()
    let fontSizeSlider = UISlider()
    let previewLabel = UILabel()
    
    //font選択ボタン
    @objc func setFontType() {
        fontBtnArray.removeAll()
        removeSubviews(parentView: generalView)
        
        previewLabel.text = "ABCDEFGHIJKLMN\nOPQRSTUVWXYZ\n1234567890\nabcdefghijklmnopqrstuvwxyz"
        previewLabel.textColor = tintColor
        previewLabel.frame.size = CGSize(width: width / 4 * 3, height: height / 3)
        previewLabel.numberOfLines = 0
        previewLabel.textAlignment = NSTextAlignment.center
        previewLabel.center = CGPoint(x: width / 2, y: 150)
        previewLabel.font = UIFont(name: strFont, size: fontSize)
        
        generalView.addSubview(previewLabel)
        
        //フォントサイズ変更スライダー
        fontSizeSlider.frame.size = CGSize(width: width / 4 * 3, height: 50)
        fontSizeSlider.center = CGPoint(x: width / 2, y: generalView.frame.height - 50)
        fontSizeSlider.layer.masksToBounds = false
        fontSizeSlider.backgroundColor = .clear
        //スライダーを動かした時の処理
        fontSizeSlider.addTarget(self, action: #selector(moveFontSlider), for: .valueChanged)
        //スライダーを動かし終わったときの処理
        fontSizeSlider.addTarget(self, action: #selector(decFontSize), for: .touchUpInside)
        fontSizeSlider.minimumValue = Float(10)
        fontSizeSlider.maximumValue = Float(20)
        fontSizeSlider.value = Float(fontSize)
        
        generalView.addSubview(fontSizeSlider)
        
        let fontChooseButton = UIButton()
        fontChooseButton.frame.size = CGSize(width: 50, height: 50)
        fontChooseButton.center = CGPoint(x: width / 2, y: generalView.frame.height / 4 * 3)
        //fontChooseButton.backgroundColor = .white
        let image = UIImage(named: "font")?.withRenderingMode(.alwaysTemplate)
        fontChooseButton.setImage(image, for: .normal)
        fontChooseButton.tintColor = tintColor
        fontChooseButton.addTarget(self, action: #selector(selectFont), for: .touchUpInside)
        
        generalView.addSubview(fontChooseButton)
        
        generalView.addSubview(fontScroll)
    }
    
    @objc func selectFont() {
                // フォントピッカーの表示設定
        let fontPickerConfig = UIFontPickerViewController.Configuration()
        
        // 複数のフォントフェイスを表示
        fontPickerConfig.includeFaces = false
        
        // 各フォント名にそのフォントを適応する (true だとシステムフォントで表示されるっぽい)
        fontPickerConfig.displayUsingSystemFont = false
        
        // 日本語フォントのみ表示
        fontPickerConfig.filteredLanguagesPredicate = UIFontPickerViewController.Configuration.filterPredicate(forFilteredLanguages: ["en"])
        
        // フォントピッカーの設定
        let fontPicker = UIFontPickerViewController(configuration: fontPickerConfig)
        fontPicker.delegate = self
        
        self.present(fontPicker, animated: true, completion: nil)
    }

    // UIFontPickerViewControllerDelegate - 選択後
    func fontPickerViewControllerDidPickFont(_ fontPicker: UIFontPickerViewController) {
        if let fontName = fontPicker.selectedFontDescriptor?.postscriptName {
            print("FontName: \(fontName)")
            previewLabel.font = UIFont(name: fontName, size: fontSize)
            strFont = fontName
        }
    }

    // UIFontPickerViewControllerDelegate - キャンセル
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
    }
    
    @objc func chooseFont(_ sender: UIButton) {
        for i in 0 ..< fontBtnArray.count {
            fontBtnArray[i].layer.borderWidth = 0.0
        }
        
        sender.layer.borderWidth = 2.0
        sender.layer.borderColor = UIColor.black.cgColor
        strFont = fontArray[sender.tag]
        fontLabel.font = UIFont(name: strFont, size: fontSize)
    }
    
    @objc func moveFontSlider(_ sender: UISlider) {
        fontLabel.font = UIFont(name: strFont, size: CGFloat(sender.value))
        previewLabel.font = UIFont(name: strFont, size: CGFloat(sender.value))
    }
    
    @objc func decFontSize(_ sender: UISlider) {
        fontSize = CGFloat(sender.value)
    }
    
    func removeSubviews(parentView: UIView) {
        let subviews = parentView.subviews
        for sub in subviews {
            sub.removeFromSuperview()
        }
    }
    //********************************************************************
    let dataClass = GeneralDataManagement()
    
    override func viewWillAppear(_ animated: Bool) {
        let getData = dataClass.getData()
        strFont = getData.0
        iconSize = getData.1
        backColor = getData.2
        fontSize = getData.3
        
        view.backgroundColor = UIColor(colorCode: backColor)
        
        setParts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        dataClass.putData(strFont: strFont, iconSize: iconSize, backColor: backColor, fontSize: fontSize)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //アイコンの色を白か黒か決める
    func DecitionImageColor(_ color: UIColor) -> (UIColor) {
        let components = color.cgColor.components!
        let red = components[0] * 255
        let green = components[1] * 255
        let blue = components[2] * 255
        
        var color: UIColor = .black
        if ((red * 0.299 + green * 0.587 + blue * 0.114) < 128) {
            color = .white
        }
        return color
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

