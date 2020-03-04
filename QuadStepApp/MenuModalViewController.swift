//
//  MenuModalViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/26.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

protocol MakeButtonActionDelegate {
    func startMakeButton(title: String, contentText: String, iconColor: String, iconName: String)
}

class MenuModalViewController: UIViewController {
    
    var fontType: String = ""
    
    var delegate: MakeButtonActionDelegate?
    
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    let decBtn1 = UIButton()
    
    let colorBarBtn = UIButton()
    var colorBarFlg: Bool = false
    
    var titleField = CustomTextField()
    let border = CALayer() //titleFieldの下線
    var contentView = UITextView()
    
    var iconView = UIView()
    var noneIconImage = UIImage(named: "none_100")?.withRenderingMode(.alwaysTemplate)
    var iconButton = UIButton() //アイコン選択ボタン
    var iconViewFlg: Bool = false
    var backColor: String = "000000"
    
    //アイコン、文字の色
    var tintColor: UIColor = .white
    
    //メモの種類ボタン
    let textBtn = UIButton()
    let todoBtn = UIButton()
    let listBtn = UIButton()
    
    //色選択ようのバー
    var colorListView = UIView()
    
    //アイコン名
    let iconName: [String] = ["account","add-reminder","chat","doughnut","happy","man-money","pdf","sent","post","zip",
                                "play","system","admin","key","block", "euro"]
    
    let iconNameList: [String] = ["icons8-agreement-100", "icons8-kicking-100", "icons8-airport-100", "icons8-leo-100", "icons8-answers-100", "icons8-libra-100",
    "icons8-aquarius-100", "icons8-lock-100","icons8-aries-100", "icons8-meal-100","icons8-attack-100", "icons8-music-100","icons8-bad-idea-100", "icons8-news-100",
    "icons8-bonds-100", "icons8-opened-folder-100","icons8-bookmark-100", "icons8-pisces-100","icons8-cafe-100", "icons8-planet-100","icons8-cancer-100", "icons8-punching-100",
    "icons8-capricorn-100", "icons8-questionnaire-100","icons8-cinema-100", "icons8-reserve-100","icons8-city-100", "icons8-restaurant-100",
    "icons8-clock-100", "icons8-roller-coaster-100","icons8-comet-100", "icons8-sagittarius-100","icons8-confetti-100", "icons8-scorpio-100",
    "icons8-document-100", "icons8-search-100","icons8-doughnut-chart-100", "icons8-shooting-stars-100","icons8-edit-100", "icons8-speech-bubble-100",
    "icons8-facebook-old-100", "icons8-support-100","icons8-ferris-wheel-100", "icons8-taurus-100","icons8-galaxy-100", "icons8-terms-and-conditions-100",
    "icons8-gemini-100", "icons8-tire-swing-100","icons8-idea-bank-100", "icons8-to-do-100","icons8-inspection-100", "icons8-twitter-100",
    "icons8-instagram-100", "icons8-virgo-100","icons8-internet-100"]
    
    //color
    let moonNightColor: [String] = ["002b40","d9e9e5","6cb2d3","1d4b69","b1c7d4","f4f2db","94a1a9","424f56","004f7a","7a8a92","fde5c5","dce5ec","9a7fb8","cd659f","829ac8","77c2b9","3389ca","eaf4f9","E8473E","8ebbb1","d62e8a","e73462","00b8ee","fdf262","f5e49e","ca9170","dec39c","d56950","4b4846","89a3d3","e0e565","d82630","e50011","ee7700","fff000","00a73b","0064b3","5f1885","2a2489","fefefe"]
    
    //青、黄色、赤、灰色、青紫、オレンジ、ピンク、金色
    let manyColor: [String] = ["239dda","2980af","1d50a2","007d8e","0068b7","008db7","00a0e9","3a8daa","26499d",
                                "ffd900","fcc800","f5e56b","d2b74e","f8b500","fff33f","fff2b8","ffdc00","fff262",
                                "d7003a","e95464","b7282d","e94709","c82b55","e83f5f","932e44","ea5548","e9474d",
                                "949495","767676","7b8174","7a7c7d","afafb0","a99e93","ced1d3","c9c9c4","615f62",
                                "4e67b0","5654a2","706caa","bbbcde","51318f","4052a2","714f9d","c5b3d3","8e8bc2",
                                "f08300","ed6d3d","ee7948","f6ad48","f7b977","efa718","f39800","fbd8b5","df6c31",
                                "f09199","e7acb9","fef4f4","e94e66","f29c9f","f4ada3","fdeadf","da8d93","f5b090",
                                "e48e00","fabf13","f7dc8d","f8b856","fdd000","a36b21","d98032","c4972f","fdd75d"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        height = view.frame.height
        width = view.frame.width
        
        view.backgroundColor = UIColor(colorCode: "829ac8")
        tintColor = DecitionImageColor(view.backgroundColor!)
        
        setButton()
        
        //textViewにDoneボタンを追加
        setToolbarTextView()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //contentView.becomeFirstResponder()
    }
    
    func setToolbarTextView() {
        // ツールバー生成 サイズはsizeToFitメソッドで自動で調整される。
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

        //サイズの自動調整。敢えて手動で実装したい場合はCGRectに記述してsizeToFitは呼び出さない。
        toolBar.sizeToFit()

        // 左側のBarButtonItemはflexibleSpace。これがないと右に寄らない。
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        // Doneボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(commitButtonTapped))

        // BarButtonItemの配置
        toolBar.items = [spacer, commitButton]
        // textViewのキーボードにツールバーを設定
        contentView.inputAccessoryView = toolBar
    }
    
    //キーボードのDoneボタンを押したらキーボード閉じる
    @objc func commitButtonTapped() {
        contentView.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    func setButton() {
        //確定ボタン
        let decIcon = UIImage(named: "OK_100")?.withRenderingMode(.alwaysTemplate)
        decBtn1.frame.size = CGSize(width: height / 15, height: height / 15)
        decBtn1.center = CGPoint(x: view.center.x, y: height / 10 * 9)
        decBtn1.layer.cornerRadius = height / 20
        decBtn1.setImage(decIcon, for: .normal)
        decBtn1.tintColor = tintColor
        decBtn1.addTarget(self, action: #selector(doneIcon), for: .touchUpInside)
        
        view.addSubview(decBtn1)
        
        //colorBarオープン、クローズボタン
        let colorIcon = UIImage(named: "palette_100")?.withRenderingMode(.alwaysTemplate)
        colorBarBtn.setImage(colorIcon, for: .normal)
        colorBarBtn.frame.size = CGSize(width: height / 15, height: height / 15)
        colorBarBtn.center = CGPoint(x: width / 4 * 3, y: height / 10 * 9)
        colorBarBtn.tintColor = tintColor
        colorBarBtn.addTarget(self, action: #selector(openColorBar), for: .touchUpInside)
        
        view.addSubview(colorBarBtn)
        
        //アイコンボタン
        //iconButton.frame = CGRect(x: width / 10 * 7, y: height / 10 * 0.5, width: height / 13, height: height / 13)
        iconButton.setImage(noneIconImage, for: .normal)
        iconButton.frame.size = CGSize(width: height / 15, height: height / 15)
        iconButton.center = CGPoint(x: width / 4, y: height / 10 * 9)
        iconButton.tintColor = tintColor
        iconButton.addTarget(self, action: #selector(openIconView), for:.touchUpInside)
        
        view.addSubview(iconButton)
        
        //タイトル入力フィールド（UITextFieldのカスタムクラス（Doneボタンの追加））
        titleField.borderStyle = .none
        titleField.frame = CGRect(x: width / 10 * 0.5, y: height / 10 * 0.5, width: width / 10 * 6, height: height / 10)
        titleField.font = UIFont(name: fontType, size: 30.0)
        titleField.textColor = tintColor
        
        //タイトルフィールドに下線をつける
        border.borderColor = tintColor.cgColor
        border.frame = CGRect(x: 0, y: titleField.frame.size.height - 2.0, width: titleField.frame.size.width, height: 1)
        border.borderWidth = 2.0
        titleField.layer.addSublayer(border)
        
        view.addSubview(titleField)
        
        //メモ記入エリア
        contentView.frame = CGRect(x: width / 10 * 0.5, y: height / 10 * 1.5, width: width / 10 * 9.5, height: height / 10 * 6)
        contentView.layer.cornerRadius = 10.0
        contentView.backgroundColor = .clear
        contentView.font = UIFont(name: fontType, size: 20)
        contentView.textColor = tintColor
        
        view.addSubview(contentView)
        
        /******************色選択バー***************/
        colorListView.frame = CGRect(x: width, y: 0, width: width / 10, height: height)
        //色選択ようバー
        let colorBar = UIScrollView()
        colorBar.frame = CGRect(x: 0, y: 0, width: width / 10, height: height)
        colorBar.contentSize = CGSize(width: width / 10, height: CGFloat(manyColor.count + 1) * (height / 15))
        //カラーバーに色ボタンを装着
        for i in 0 ..< manyColor.count {
            let colorButton = CustomUIButton()
            let btnHeight = height / 15 * CGFloat(i)
            colorButton.frame = CGRect(x: 0, y: btnHeight, width: colorBar.frame.width, height: height / 15)
            colorButton.backgroundColor = UIColor(colorCode: manyColor[i])
            colorButton.color = manyColor[i]
            colorButton.addTarget(self, action: #selector(backColorChange), for: .touchUpInside)
            
            colorBar.addSubview(colorButton)
        }
        colorListView.addSubview(colorBar)
        view.addSubview(colorListView)
        
        /******************アイコン選択バー*******************/
        iconView.frame = CGRect(x: width, y: 0, width: width / 10, height: height)
        //アイコン一覧のスクロールView
        let scrollIconView = UIScrollView()
        scrollIconView.frame = CGRect(x: 0, y: 0, width: width / 10, height: height)
        scrollIconView.contentSize = CGSize(width: width / 10, height: CGFloat(iconName.count + 1) * (height / 15))
        //アイコンバーにアイコンを装着
        for i in 0 ..< iconName.count {
            let iconBtn = UIButton()
            let btnHeight = height / 15 * CGFloat(i)
            iconBtn.frame = CGRect(x: 0, y: btnHeight, width: scrollIconView.frame.width, height: scrollIconView.frame.width)
            iconBtn.setImage(UIImage(named: iconName[i]), for: .normal)
            iconBtn.tag = i
            iconBtn.addTarget(self, action: #selector(chooseIcon), for:.touchUpInside)
            
            scrollIconView.addSubview(iconBtn)
        }
        iconView.addSubview(scrollIconView)
        view.addSubview(iconView)
        
    }
    var iconStr: String = "none_100"
    @objc func chooseIcon(_ sender: UIButton) {
        noneIconImage = UIImage(named: iconName[sender.tag])?.withRenderingMode(.alwaysTemplate)
        iconButton.setImage(noneIconImage, for: .normal)
        iconStr = iconName[sender.tag]
    }
    
    
    
    
    @objc func openIconView() {
        if colorBarFlg {
            let colorIcon = UIImage(named: "palette_100")?.withRenderingMode(.alwaysTemplate)
            colorBarBtn.setImage(colorIcon, for: .normal)
            colorBarBtn.tintColor = tintColor
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.colorListView.center.x += self.colorListView.frame.width
            }, completion: nil)
            colorBarFlg = false
        }
        
        if iconViewFlg {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.iconView.center.x += self.iconView.frame.width
            }, completion: nil)
            iconViewFlg = false
        }else {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.iconView.center.x -= self.iconView.frame.width
            }, completion: nil)
            iconViewFlg = true
        }
        
        
    }
    
    //カラー選択ボタン押下時
    @objc func openColorBar() {
        if iconViewFlg {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.iconView.center.x += self.iconView.frame.width
            }, completion: nil)
            iconViewFlg = false
        }
        if colorBarFlg {
            let colorIcon = UIImage(named: "palette_100")?.withRenderingMode(.alwaysTemplate)
            colorBarBtn.setImage(colorIcon, for: .normal)
            colorBarBtn.tintColor = tintColor
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.colorListView.center.x += self.colorListView.frame.width
            }, completion: nil)
            colorBarFlg = false
            
        }else {
            let colorIcon = UIImage(named: "palette_color_96")
            colorBarBtn.tintColor = nil
            colorBarBtn.setImage(colorIcon, for: .normal)
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.colorListView.center.x -= self.colorListView.frame.width
            }, completion: nil)
            colorBarFlg = true
            
        }
    }
    
    @objc func backColorChange(_ sender: CustomUIButton) {
        
        backColor = sender.color!
        view.backgroundColor = UIColor(colorCode: backColor)
        
        let wordColor: UIColor = DecitionImageColor(UIColor(colorCode: backColor))
        tintColor = wordColor
        decBtn1.tintColor = tintColor
        titleField.textColor = tintColor
        contentView.textColor = tintColor
        border.borderColor = tintColor.cgColor
        iconButton.tintColor = tintColor
    }
    
    //完了ボタン押下時
    @objc func doneIcon() {
        var titleText: String = ""
        var contentText: String = ""
        
        self.dismiss(animated: true, completion: {
            if let del = self.delegate {
                titleText = self.titleField.text!
                contentText = self.contentView.text!
                
                del.startMakeButton(title: titleText, contentText: contentText, iconColor: self.backColor, iconName: self.iconStr)
            } else {
                print("unwrap error")
            }
        })
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

