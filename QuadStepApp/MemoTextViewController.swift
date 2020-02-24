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
}

class MemoTextViewController: UIViewController, UITextViewDelegate {
    
    var delegate: RemoveButtonActionDelegate?
    
    //選んだボタンのインスタンス（削除するとき用）
    var btnID = ""
    
    var fontType: String = ""
    
    var backColor: UIColor = .white
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //キーボードに合わせてScrollViewずらす
        //configureObserver()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = backColor
        
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
        
        secondView.frame = CGRect(x: width, y: 0, width: width, height: height / 10 * 8.5)
        secondView.backgroundColor = .clear
        
        //削除ボタン
        let deleteBtn = UIButton()
        let deleteIcon = UIImage(named: "delete_100")?.withRenderingMode(.alwaysTemplate)
        deleteBtn.frame = CGRect(x: width + (width / 5 * 4), y: height / 10 * 8.5, width: height / 15, height: height / 15)
        deleteBtn.setImage(deleteIcon, for: .normal)
        deleteBtn.tintColor = tintColor
        deleteBtn.addTarget(self, action: #selector(tapDeleteBtn), for: .touchUpInside)
        pageScrollView.addSubview(deleteBtn)
        
        //colorボタン
        let colorBtn = UIButton()
        colorBtn.frame = CGRect(x: width / 5 * 1, y: height / 10 * 4, width: height / 15, height: height / 15)
        colorBtn.backgroundColor = .black
        secondView.addSubview(colorBtn)
        
        //imageボタン
        let imageBtn = UIButton()
        imageBtn.frame = CGRect(x: width / 5 * 3 + height / 15, y: height / 10 * 4, width: height / 15, height: height / 15)
        imageBtn.backgroundColor = .red
        secondView.addSubview(imageBtn)
        
        
        
        
        
        pageScrollView.addSubview(secondView)
    }
    
    //UIView上のパーツを全て削除
    func removeSubviews(parentView: UIView) {
        let subviews = parentView.subviews
        for sub in subviews {
            sub.removeFromSuperview()
        }
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
