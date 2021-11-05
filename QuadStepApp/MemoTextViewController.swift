//
//  MemoTextViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/02/05.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

//ホーム画面からボタン削除する用
protocol RemoveButtonActionDelegate {
    func removeIcon(removeID: String)
    func updateIcon(updateId: String, updateTitle: String, updateText: String, updateColor: String, updateImage: String)
}

protocol MakeButtonActionDelegate {
    func startMakeButton(title: String, contentText: String, iconColor: String, iconName: String)
}

class MemoTextViewController: UIViewController, UITextViewDelegate {
    
    var removeIconDelegate: RemoveButtonActionDelegate?
    var makeIconDelegate: MakeButtonActionDelegate?
    
    var makeFlag: Bool = false
    
    //選んだボタンのインスタンス（削除するとき用）
    var btnID = ""
    
    var fontType: String = ""
    
    var backColor: String = "000000"
    var tintColor: UIColor = .white
    
    var titleText: String = ""
    var contentText: String = ""
    var iconCode: String = ""
    var fontSize: CGFloat = 0.0

    
    var scrollView = UIScrollView()
    var textView = UITextView()
    var titleField = CustomTextField()
    
    private var height: CGFloat = 0
    private var width: CGFloat = 0
    
    //ページ作成用
    private var pageScrollView = UIScrollView()
    private var pageControll = UIPageControl()
    private var pageNum: Int!
    
    //新規作成ボタン
    let decBtn1 = CustomUIButton()
    //キャンセルボタン
    let cancelBtn = CustomUIButton()
    
    //2ページ目のパーツ
    var secondView = UIView()
    let imageBtn = CustomUIButton()
    let deleteBtn = CustomUIButton()
    let colorBtn = CustomUIButton()
    
    //アイコン一覧を表示するView
    let iconScroll = UIScrollView()

    let iconListArray: [[String]] = IconData.shared.getIconData()
    
    let colorArray: [[String]] = ColorData.shared.getColorData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        scrollView.delegate = self
        
        height = view.frame.height
        width = view.frame.width
        
        //ページ形式になるようセッティング
        pageSetting()
        //1ページ目のパーツ配置
        setPartsFirst()
        //2ページ目のパーツ配置
        setPartsSecond()
        
        //アイコンリスト読み込み
        let queue = DispatchQueue.global(qos: .default)
        
        queue.async {
            print("非同期処理開始")
            //self.MakeIconList()
            print("非同期処理終了")
        }
        
        
        pageScrollView.addSubview(scrollView)
        view.addSubview(pageScrollView)
        view.addSubview(pageControll)
        
        //キーボードの開閉で処理
        NotificationCenter.default.addObserver(self, selector: #selector(ShowedKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ClosedKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        MakeIconList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("MemoTextViewController - viewWillAppear")
        //背景色設定
        view.backgroundColor = UIColor(colorCode: backColor)
        //tintcolor設定
        tintColor = DecitionImageColor(view.backgroundColor!)
        
        //tintColorの設定
        TintcolorUpdate()
        
        //データ配置処理
        DataPaste()
        
        //
        iconFrameLabel.layer.borderColor = UIColor.clear.cgColor
        
        //確定ボタン
        let decIcon = UIImage(named: "OK_100")?.withRenderingMode(.alwaysTemplate)
        decBtn1.title = "definite"
        decBtn1.frame = CGRect(x: width - 80, y: height - 80, width: 120, height: 120)
        decBtn1.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 60, right: 60)
        decBtn1.layer.cornerRadius = 40
        decBtn1.layer.borderWidth = 1.0
        decBtn1.layer.borderColor = DecitionImageColor(UIColor(colorCode: backColor)).cgColor
        decBtn1.setImage(decIcon, for: .normal)
        decBtn1.tintColor = DecitionImageColor(UIColor(colorCode: backColor))
        decBtn1.backgroundColor = .clear
        decBtn1.addTarget(self, action: #selector(doneIcon), for: .touchUpInside)
        view.addSubview(decBtn1)
        
        let cancelImage = UIImage(named: "icons8-cancel-100")?.withRenderingMode(.alwaysTemplate)
        cancelBtn.frame = CGRect(x: -40, y: height - 80, width: 120, height: 120)
        cancelBtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 60, bottom: 60, right: 30)
        cancelBtn.layer.cornerRadius = 40
        cancelBtn.layer.borderWidth = 1.0
        cancelBtn.layer.borderColor = DecitionImageColor(UIColor(colorCode: backColor)).cgColor
        cancelBtn.setImage(cancelImage, for: .normal)
        cancelBtn.tintColor = DecitionImageColor(UIColor(colorCode: backColor))
        cancelBtn.backgroundColor = .clear
        cancelBtn.addTarget(self, action: #selector(TapCancel), for: .touchUpInside)
        view.addSubview(cancelBtn)
        
        //新規作成の場合は確定ボタン,閲覧の場合は削除ボタンを配置
        if makeFlag {
            deleteBtn.isHidden = true
            decBtn1.isHidden = false
            textView.becomeFirstResponder()
            iconCode = ""
        } else {
            //decBtn1.isHidden = true
            deleteBtn.isHidden = false
        }
        
        pageScrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    @objc func TapCancel() {
        print("cancel")
        dismiss(animated: true, completion: nil)
    }
    
    func TintcolorUpdate() {
        
        deleteBtn.tintColor = tintColor
        colorBtn.tintColor = tintColor
        imageBtn.tintColor = tintColor
        textView.textColor = tintColor
        titleField.textColor = tintColor
        
        
        iconFrameLabel.layer.borderColor = tintColor.cgColor
        
        decBtn1.layer.borderColor = tintColor.cgColor
        cancelBtn.layer.borderColor = tintColor.cgColor
        textView.tintColor = tintColor
        titleField.tintColor = tintColor
        
        for v in iconScroll.subviews {
            if let v = v as? CustomUIButton {
                v.tintColor = tintColor
            }
        }
    }
    
    func DataPaste() {
        titleField.font = UIFont(name: fontType, size: fontSize + 5)
        titleField.textColor = tintColor
        titleField.text = titleText
        
        textView.textColor = tintColor
        textView.font = UIFont(name: fontType, size: fontSize)
        textView.text = contentText
    }
    
    func setPartsFirst() {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

        //textViewにDoneボタンを追加
        setToolbarTextView()
        
        titleField.frame = CGRect(x: width / 10 * 0.5, y: height / 10 * 0.5, width: width / 10 * 9.5, height: height / 10)
        titleField.placeholder = "Title"
        
        scrollView.addSubview(titleField)
        
        
        textView.frame = CGRect(x: width / 10 * 0.5, y: height / 10 * 1.5, width: width / 10 * 9.5, height: height / 10 * 7)
        textView.backgroundColor = .clear
        textView.layer.cornerRadius = 10.0
        
        
        textView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.blue
        ]
        textView.isSelectable = true
        textView.dataDetectorTypes = .link
        
        scrollView.addSubview(textView)
    
        //削除ボタン
        let deleteIcon = UIImage(named: "delete_100")?.withRenderingMode(.alwaysTemplate)
        deleteBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        deleteBtn.frame.size = CGSize(width: 70, height: 70)
        deleteBtn.center = CGPoint(x: width + width / 5 * 4, y: height / 10 * 8.5)
        deleteBtn.setImage(deleteIcon, for: .normal)
        deleteBtn.tintColor = tintColor
        deleteBtn.addTarget(self, action: #selector(tapDeleteBtn), for: .touchUpInside)
        pageScrollView.addSubview(deleteBtn)
    }
    
    //2ページ目の設定
    func setPartsSecond() {
        
        secondView.frame = CGRect(x: width, y: 0, width: width, height: height / 10 * 8)
        //colorボタン
        let colorIcon = UIImage(named: "palette_100")?.withRenderingMode(.alwaysTemplate)
        colorBtn.frame.size = CGSize(width: 70, height: 70)
        colorBtn.center = CGPoint(x: width + width / 5, y: height / 10 * 8.5)
        colorBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        colorBtn.addTarget(self, action: #selector(colorSet), for: .touchUpInside)
        colorBtn.setImage(colorIcon, for: .normal)
        colorBtn.tintColor = tintColor
        pageScrollView.addSubview(colorBtn)
        
        //imageボタン
        let imageIcon = UIImage(named: "image_100")?.withRenderingMode(.alwaysTemplate)
        imageBtn.frame.size = CGSize(width: 70, height: 70)
        imageBtn.center = CGPoint(x: width + width / 2, y: height / 10 * 8.5)
        imageBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        imageBtn.addTarget(self, action: #selector(tapImageBtn), for: .touchUpInside)
        imageBtn.setImage(imageIcon, for: .normal)
        imageBtn.tintColor = tintColor
        pageScrollView.addSubview(imageBtn)
        
        pageScrollView.addSubview(secondView)
        

    }
    //アイコン一覧表示
    @objc func tapImageBtn() {
        removeSubviews(parentView: secondView)

        secondView.addSubview(iconScroll)
    }
    
    func MakeIconList() {
        //アイコン一覧画面設定
        iconScroll.frame = CGRect(x: 0, y: secondView.frame.height * 0.1, width: secondView.frame.width, height: secondView.frame.height * 0.9)
        
        //1行に並ぶアイコンの数
        let iconPerLine = Int(width) / 50
        var lineCount = 0
        var iconCount = 0
        for i in 0 ..< iconListArray.count {
            for j in 0 ..< iconListArray[i].count {
                print("アイコン作成 \(iconCount)")
                iconCount += 1
                
                let xPos = j % iconPerLine
                let yPos = j / iconPerLine + lineCount
                
                let iconStr = UIImage(named: iconListArray[i][j])?.withRenderingMode(.alwaysTemplate)
                let iconBtn = CustomUIButton()
                iconBtn.iconCode = iconListArray[i][j]
                iconBtn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                iconBtn.frame = CGRect(x: width / CGFloat(iconPerLine) * CGFloat(xPos), y: CGFloat(yPos) * 50, width: 50, height: 50)
                iconBtn.setImage(iconStr, for: .normal)
                iconBtn.tintColor = tintColor
                iconBtn.addTarget(self, action: #selector(selectIcon), for: .touchUpInside)
                
                iconScroll.addSubview(iconBtn)
            }
            lineCount = lineCount + (iconListArray[i].count / iconPerLine) + 1
        }
        iconScroll.contentSize = CGSize(width: width, height: CGFloat(lineCount + 1) * 100)
    }
    
    let iconFrameLabel = UILabel()
    
    //アイコンを選んだ時の処理
    @objc func selectIcon(_ sender: CustomUIButton) {
        
        iconFrameLabel.frame.size = CGSize(width: 50, height: 50)
        iconFrameLabel.center = sender.center
        iconFrameLabel.layer.borderWidth = 1.0
        iconFrameLabel.layer.borderColor = tintColor.cgColor
        iconScroll.addSubview(iconFrameLabel)
        
        iconCode = sender.iconCode!
        let decIcon = UIImage(named: iconCode)?.withRenderingMode(.alwaysTemplate)
        decBtn1.setImage(decIcon, for: .normal)
    }
    
    //UIView上のパーツを全て削除
    func removeSubviews(parentView: UIView) {
        let subviews = parentView.subviews
        for sub in subviews {
            sub.removeFromSuperview()
        }
    }
    
    //色選択ボタン表示
    @objc func colorSet() {
        removeSubviews(parentView: secondView)
        
        let btnWidth = secondView.frame.width / 9
        let btnHeight = secondView.frame.height / 10
        
        let colorScroll = UIScrollView()
        colorScroll.frame = CGRect(x: 0, y: secondView.frame.height * 0.1, width: secondView.frame.width, height: secondView.frame.height * 0.9)
        
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
        colorScroll.contentSize = CGSize(width: secondView.frame.width, height: btnHeight * CGFloat(colorArray.count + 1))
        
        secondView.addSubview(colorScroll)
    }
    
    //色を選択した時の処理
    @objc func tapColorButton(_ sender: CustomUIButton) {
        backColor = sender.colorCode!
        view.backgroundColor = UIColor(colorCode: backColor)
        tintColor = DecitionImageColor(UIColor(colorCode: backColor))
        
        //tintColorの設定
        TintcolorUpdate()

        decBtn1.tintColor = tintColor
        cancelBtn.tintColor = tintColor
    }

    //デリートボタンを選択した時の処理
    @objc func tapDeleteBtn() {
        Alert(title: "Delete?", message: "")
    }
    
    //削除確認アラート表示関数
    func Alert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
            print("yes")
            self.dismiss(animated: true, completion: {
                if let del = self.removeIconDelegate {
                    del.removeIcon(removeID: self.btnID)
                } else {
                    print("unwrap error")
                }
            })
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: { (UIAlertAction) in
            print("no")
        })
        alertController.addAction(okAction)
        alertController.addAction(noAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    //
    func pageSetting() {
        pageScrollView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        pageScrollView.contentSize = CGSize(width: width * 2, height: height)
        pageScrollView.delegate = self
        pageScrollView.isPagingEnabled = true
        pageScrollView.showsHorizontalScrollIndicator = false
        
        //view.addSubview(pageScrollView)
        pageControll.frame = CGRect(x: 0, y: height / 10 * 9, width: width, height: 20)
        pageControll.numberOfPages = 2
        pageControll.pageIndicatorTintColor = .lightGray
        pageControll.currentPageIndicatorTintColor = .black
        
    }
    
    //完了ボタン押下時
    @objc func doneIcon() {
        var titleText: String = ""
        var contentText: String = ""
        
        titleText = titleField.text!
        contentText = textView.text
        
        print("update icon-> \(iconCode)")
        
        if makeFlag {
            self.dismiss(animated: true, completion: {
                if let del = self.makeIconDelegate {
                    titleText = self.titleField.text!
                    contentText = self.textView.text!
                    
                    del.startMakeButton(title: titleText, contentText: contentText, iconColor: self.backColor, iconName: self.iconCode)
                } else {
                    print("unwrap error")
                }
            })
        } else {
            self.dismiss(animated: true, completion: {
                if let del  = self.removeIconDelegate {
                    del.updateIcon(updateId: self.btnID, updateTitle: titleText, updateText: contentText, updateColor: self.backColor, updateImage: self.iconCode)
                } else {
                    print("unwrap error")
                }
            })

        }

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
        textView.inputAccessoryView = toolBar
    }
    
    //キーボードのDoneボタンを押したらキーボード閉じる
    @objc func commitButtonTapped() {
        textView.resignFirstResponder()
        self.view.endEditing(true)
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
    //キーボード出現時
    @objc func ShowedKeyboard() {
        print("Opened Keyboard")
        textView.frame = CGRect(x: width / 10 * 0.5, y: height / 10 * 1.5, width: width / 10 * 9.5, height: height / 10 * 3.5)
    }
    //キーボード消滅時
    @objc func ClosedKeyboard() {
        print("Closed Keyboard")
        textView.frame = CGRect(x: width / 10 * 0.5, y: height / 10 * 1.5, width: width / 10 * 9.5, height: height / 10 * 7)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension MemoTextViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(pageScrollView.contentOffset.x / pageScrollView.frame.width)
    }
}
