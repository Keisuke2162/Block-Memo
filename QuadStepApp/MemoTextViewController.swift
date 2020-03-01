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
    func updateIcon(updateId: String, updateTitle: String, updateText: String, updateColor: String)
}

class MemoTextViewController: UIViewController, UITextViewDelegate {
    
    var delegate: RemoveButtonActionDelegate?
    
    //選んだボタンのインスタンス（削除するとき用）
    var btnID = ""
    
    var fontType: String = ""
    
    var backColor: String = "000000"
    var tintColor: UIColor = .white
    
    var titleText: String = ""
    var contentText: String = ""
    
    var scrollView = UIScrollView()
    var textView = UITextView()
    var titleField = CustomTextField()
    
    private var height: CGFloat = 0
    private var width: CGFloat = 0
    
    //ページ作成用
    private var pageScrollView = UIScrollView()
    private var pageControll = UIPageControl()
    private var pageNum: Int!
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //キーボードに合わせてScrollViewずらす
        //configureObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        titleText = titleField.text!
        contentText = textView.text
        print("update color-> \(backColor)")
        if let del = self.delegate {
            del.updateIcon(updateId: btnID, updateTitle: titleText, updateText: contentText, updateColor: backColor)
        } else {
            print("unwrap error")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorArray = [red, orange, yellow, yellowGreen, green, blueGreen, aquaSky, blue, indigo, violet,
                      magenta, pink, brown, blackWhite, gold, silver]
        
        view.backgroundColor = UIColor(colorCode: backColor)
        
        textView.delegate = self
        scrollView.delegate = self
        
        height = view.frame.height
        width = view.frame.width
        
        
        //おページ形式になるようセッティング
        pageSetting()
        //1ページ目のセッティング
        setPartsFirst()
        //2ページ目のセッティング
        setPartsSecond()
        pageScrollView.addSubview(scrollView)
        view.addSubview(pageScrollView)
        view.addSubview(pageControll)
    }
    var secondView = UIView()
    func setPartsSecond() {
        
        secondView.frame = CGRect(x: width, y: 0, width: width, height: height / 10 * 8)
        secondView.backgroundColor = .clear
        
        //削除ボタン
        let deleteBtn = UIButton()
        let deleteIcon = UIImage(named: "delete_100")?.withRenderingMode(.alwaysTemplate)
        deleteBtn.frame = CGRect(x: width + (width / 5 * 4), y: height / 10 * 8, width: height / 15, height: height / 15)
        deleteBtn.setImage(deleteIcon, for: .normal)
        deleteBtn.tintColor = tintColor
        deleteBtn.addTarget(self, action: #selector(tapDeleteBtn), for: .touchUpInside)
        pageScrollView.addSubview(deleteBtn)
        
        //colorボタン
        let colorBtn = UIButton()
        //colorBtn.frame = CGRect(x: width / 5 * 1, y: height / 10 * 4, width: height / 15, height: height / 15)
        colorBtn.frame = CGRect(x: width + (width / 5 * 1), y: height / 10 * 8, width: height / 15, height: height / 15)
        colorBtn.backgroundColor = .black
        colorBtn.addTarget(self, action: #selector(colorSet), for: .touchUpInside)
        //secondView.addSubview(colorBtn)
        pageScrollView.addSubview(colorBtn)
        
        //imageボタン
        let imageBtn = UIButton()
        //imageBtn.frame = CGRect(x: width / 5 * 3 + height / 15, y: height / 10 * 4, width: height / 15, height: height / 15)
        imageBtn.frame = CGRect(x: width + (width / 5 * 2), y: height / 10 * 8, width: height / 15, height: height / 15)
        imageBtn.backgroundColor = .red
        //secondView.addSubview(imageBtn)
        pageScrollView.addSubview(imageBtn)
        
        pageScrollView.addSubview(secondView)
    }
    
    //UIView上のパーツを全て削除
    func removeSubviews(parentView: UIView) {
        let subviews = parentView.subviews
        for sub in subviews {
            sub.removeFromSuperview()
        }
    }

    
    
    @objc func colorSet() {
        //let colorArray: [[String]] = [NightViewColor, gamlaColor, summerColor, rainbowColor, moonNightColor]
        removeSubviews(parentView: secondView)
        
        let btnWidth = secondView.frame.width / 9
        let btnHeight = secondView.frame.height / 10
        
        let colorScroll = UIScrollView()
        colorScroll.frame = CGRect(x: 0, y: 0, width: secondView.frame.width, height: secondView.frame.height)
        
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
    
    @objc func tapColorButton(_ sender: CustomUIButton) {
        print("change backColor")
        backColor = sender.colorCode!
        view.backgroundColor = UIColor(colorCode: backColor)
    }

    
    @objc func tapImageBtn() {
        
    }
    
    @objc func tapDeleteBtn() {
        Alert(title: "Delete?", message: "")
    }
    
    
    func Alert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
            print("yes")
            self.dismiss(animated: true, completion: {
                if let del = self.delegate {
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
    
    func setPartsFirst() {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        //textViewにDoneボタンを追加
        setToolbarTextView()
        
        titleField.frame = CGRect(x: width / 10 * 0.5, y: height / 10 * 0.5, width: width / 10 * 6, height: height / 10)
        titleField.font = UIFont(name: fontType, size: 50.0)
        titleField.textColor = tintColor
        titleField.text = titleText
        
        scrollView.addSubview(titleField)
        
        
        //textView.frame.size = CGSize(width: view.frame.width / 2, height: 40)
        //textView.center = CGPoint(x: view.center.x, y: view.frame.height / 10 * 8)
        textView.frame = CGRect(x: width / 10 * 0.5, y: height / 10 * 1.5, width: width / 10 * 9.5, height: height / 10 * 7)
        textView.backgroundColor = .clear
        textView.layer.cornerRadius = 10.0
        textView.textColor = tintColor
        textView.font = UIFont(name: fontType, size: 20)
        textView.text = contentText
        
        textView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.blue
        ]
        textView.isSelectable = true
        textView.dataDetectorTypes = .link
        
        scrollView.addSubview(textView)
    }
    
    //戻るボタンを押下したら閉じる
    @objc func tappedReturn() {
        dismiss(animated: true, completion: nil)
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
    
    // Notificationを設定
    func configureObserver() {
          
      let notification = NotificationCenter.default

      notification.addObserver(
        self,
        selector: #selector(self.keyboardWillShow(notification:)),
        name: UIResponder.keyboardWillShowNotification,
        object: nil
      )
          
      notification.addObserver(
        self,
        selector: #selector(self.keyboardWillHide(notification:)),
        name: UIResponder.keyboardWillHideNotification,
        object: nil
      )
    }
      
    // Notificationを削除
    func removeObserver() {
      NotificationCenter.default.removeObserver(self)
    }
      
    // キーボードが現れたときにviewをずらす
    @objc func keyboardWillShow(notification: Notification?) {
      let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
      let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
      UIView.animate(withDuration: duration!) {
        self.view.transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
      }
    }
      
    // キーボードが消えたときにviewを戻す
    @objc func keyboardWillHide(notification: Notification?) {
      let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
      UIView.animate(withDuration: duration!) {
        self.view.transform = CGAffineTransform.identity
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


}

extension MemoTextViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(pageScrollView.contentOffset.x / pageScrollView.frame.width)
    }
}
