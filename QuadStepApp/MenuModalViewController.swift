//
//  MenuModalViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/26.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

protocol MakeButtonActionDelegate {
    func startMakeButton(title: String, contentText: String, iconColor: UIColor)
}

class MenuModalViewController: UIViewController {
    
    var delegate: MakeButtonActionDelegate?
    
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    let decBtn1 = UIButton()
    let border = CALayer() //titleFieldの下線
    let colorBarBtn = UIButton()
    var colorBarFlg: Bool = false
    var titleField = CustomTextField()
    var contentView = UITextView()
    
    //アイコン、文字の色
    var tintColor: UIColor = .white
    
    //メモの種類ボタン
    let textBtn = UIButton()
    let todoBtn = UIButton()
    let listBtn = UIButton()
    
    //色選択ようのバー
    var colorBar = UIScrollView()
    
    //color
    let moonNightColor: [String] = ["002b40","d9e9e5","6cb2d3","1d4b69","b1c7d4","f4f2db","94a1a9","424f56","004f7a","7a8a92","fde5c5","dce5ec","9a7fb8","cd659f","829ac8","77c2b9","3389ca","eaf4f9","E8473E","8ebbb1","d62e8a","e73462","00b8ee","fdf262","f5e49e","ca9170","dec39c","d56950","4b4846","89a3d3","e0e565","d82630","e50011","ee7700","fff000","00a73b","0064b3","5f1885","2a2489","fefefe"]
    
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
        titleField.becomeFirstResponder()
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
        
        //タイトル入力フィールド（UITextFieldのカスタムクラス（Doneボタンの追加））
        titleField.borderStyle = .none
        titleField.frame = CGRect(x: width / 10 * 0.5, y: height / 10 * 0.5, width: width / 10 * 6, height: height / 10)
        titleField.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 30.0)
        titleField.textColor = tintColor
        
        //タイトルフィールドに下線をつける
        border.borderColor = tintColor.cgColor
        border.frame = CGRect(x: 0, y: titleField.frame.size.height - 2.0, width: titleField.frame.size.width, height: 1)
        border.borderWidth = 2.0
        titleField.layer.addSublayer(border)
        
        view.addSubview(titleField)
        
        contentView.frame = CGRect(x: width / 10 * 0.5, y: height / 10 * 2, width: width / 10 * 9.5, height: height / 10 * 6)
        contentView.layer.cornerRadius = 10.0
        contentView.backgroundColor = .clear
        contentView.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 20)
        contentView.textColor = tintColor
        /*
        contentView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.blue
        ]
        contentView.isSelectable = true
        contentView.dataDetectorTypes = .link
        */
        
        view.addSubview(contentView)

        colorBar.frame = CGRect(x: width / 10 * 9, y: 0, width: width / 10, height: height)
        colorBar.contentSize = CGSize(width: width / 10, height: CGFloat(moonNightColor.count + 1) * (height / 15))
        colorBar.showsVerticalScrollIndicator = false
        colorBar.setContentOffset(CGPoint(x: -(width / 10), y: 0), animated: false)
        
        view.addSubview(colorBar)
        
        for i in 0 ..< moonNightColor.count {
            let colorButton = UIButton()
            let btnHeight = height / 15 * CGFloat(i)
            colorButton.frame = CGRect(x: 0, y: btnHeight, width: colorBar.frame.width, height: height / 15)
            colorButton.backgroundColor = UIColor(colorCode: moonNightColor[i])
            colorButton.addTarget(self, action: #selector(backColorChange), for: .touchUpInside)
            
            colorBar.addSubview(colorButton)
            //view.addSubview(colorButton)
        }
    }
    
    /*
     UIView.animate(withDuration: 1.0, delay: 0.0, options: .autoreverse, animations: {
         self.blueView.center.y += 100.0
     }, completion: nil)
    */
    
    @objc func openColorBar() {
        if colorBarFlg {
            let colorIcon = UIImage(named: "palette_100")?.withRenderingMode(.alwaysTemplate)
            colorBarBtn.setImage(colorIcon, for: .normal)
            colorBarBtn.tintColor = tintColor
            
            colorBar.setContentOffset(CGPoint(x: -(width / 10), y: 0), animated: true)
            colorBarFlg = false
        }else {
            let colorIcon = UIImage(named: "palette_color_96")
            colorBarBtn.tintColor = nil
            colorBarBtn.setImage(colorIcon, for: .normal)
            
            
            colorBar.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            colorBarFlg = true
        }
    }
    
    @objc func backColorChange(_ sender: UIButton) {
        let backGroundColor = sender.backgroundColor
        view.backgroundColor = backGroundColor
        
        let wordColor: UIColor = DecitionImageColor(backGroundColor!)
        tintColor = wordColor
        decBtn1.tintColor = tintColor
        titleField.textColor = tintColor
        contentView.textColor = tintColor
        border.borderColor = tintColor.cgColor
    }
    
    //完了ボタン押下時
    @objc func doneIcon() {
        var titleText: String = ""
        var contentText: String = ""
        var iconColor: UIColor = .white
        
        //HomeTabBarController経由でHome画面にオブジェクトを追加
        self.dismiss(animated: true, completion: {
            if let del = self.delegate {
                titleText = self.titleField.text!
                contentText = self.contentView.text!
                iconColor = self.view.backgroundColor!
                del.startMakeButton(title: titleText, contentText: contentText, iconColor: iconColor)
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

