//
//  MemoTextViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/02/05.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class MemoTextViewController: UIViewController, UITextViewDelegate, UIScrollViewDelegate {
    
    var fontType: String = ""
    
    var backColor: UIColor = .white
    var tintColor: UIColor = .white
    
    var titleText: String = ""
    var contentText: String = ""
    
    var scrollView = UIScrollView()
    var textView = UITextView()
    var titleField = CustomTextField()
    
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //キーボードに合わせてScrollViewずらす
        //configureObserver()
    }
    /*
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        super.viewWillDisappear(animated)
    }
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = backColor
        
        textView.delegate = self
        scrollView.delegate = self
        
        height = view.frame.height
        width = view.frame.width
        
        setParts()
        view.addSubview(scrollView)
    }
    
    func setParts() {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        //textViewにDoneボタンを追加
        setToolbarTextView()
        
        /*戻るボタン（閉じるボタン）
        let returnBtn = UIButton()
        returnBtn.frame.size = CGSize(width: 60, height: 30)
        returnBtn.center = view.center
        returnBtn.backgroundColor = .white
        returnBtn.setTitle("return", for: .normal)
        returnBtn.addTarget(self, action: #selector(tappedReturn), for: .touchUpInside)
        
        scrollView.addSubview(returnBtn)
        */
        
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
