//
//  HomeViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/24.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, MakeButtonActionDelegate, RemoveButtonActionDelegate, UISearchBarDelegate {
    
    
    
    //既存アイコンの内容を更新　→ CoreDataのデータを更新
    func updateIcon(updateId: String, updateTitle: String, updateText: String, updateColor: String) {
        //view上のsubViewの中からボタンかつ設定IDでが一致したものをターゲット
        for v in view.subviews {
            if let v = v as? CustomUIButton, v.id == updateId {
                v.title = updateTitle
                v.text = updateText
                v.color = updateColor
                v.backgroundColor = UIColor(colorCode: updateColor)
                v.tintColor = DecitionImageColor(UIColor(colorCode: updateColor))
            }
        }
        coreData.DataUpdate(updateId: updateId, updateTitle: updateTitle, updateText: updateText, updateColor: updateColor)
    }
    
    //アイコンの削除
    func removeIcon(removeID: String) {
        //view上のsubViewの中からボタンかつ設定IDでが一致したものをターゲット
        for v in view.subviews {
            if let v = v as? CustomUIButton, v.id == removeID {
                v.removeFromSuperview()
            }
        }
        //配列からも削除(重力設定の為に配列からも削除が必要)
        let num = btnArray.count
        for i in 0 ..< num {
            if removeID == btnArray[i].id  {
                btnArray.remove(at: i)
                break
            }
        }
        makeGravity(sender: btnArray)
        //Coredataからデータを削除
        coreData.DataDelete(deleteID: removeID)
    }
    
    //アイコンの新規作成処理
    func startMakeButton(title: String, contentText: String, iconColor: String, iconName: String) {
        addBtn = true //多分いらない
        setTitle = title
        setContentText = contentText
        setIconColor = iconColor
        iconString = iconName
        makeButton()
    }
    
    //設定データ読み込み用の変数
    let dataClass = GeneralDataManagement()
    var iconSize: CGFloat = 75.0
    var fontType: String = ""
    var backColor: String = "ffffff"
    var fontSize: CGFloat = 0.0
    
    //画面下部のタブの高さ
    var tabbarHeight: CGFloat = 0.0
    
    //CoreData関連データ
    let coreData = CoreDataManagement()
    var inputData: [HomeData] = []
    
    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
    
    //TabBarから受け取るデータ
    var addBtn: Bool = false
    var setTitle: String = ""
    var setContentText: String = ""
    var setIconColor: String = "000000"
    
    let memoSearch = UISearchBar()
    
    
    var iconString = "none_100"
    
    //重力設定をまとめてするための配列
    var btnArray: [CustomUIButton] = []
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    override func viewDidAppear(_ animated: Bool) {
        //userDefaultから設定とってくる（設定画面から返ってきた時に通る）
        let getData = dataClass.getData()
        fontType = getData.0
        iconSize = getData.1
        backColor = getData.2
        fontSize = getData.3
        
        
        view.backgroundColor = UIColor(colorCode: backColor)
    }
    
    let subView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setToolbarSearchBar()
        
        width = view.frame.width
        height = view.frame.height
        
        
        //userDefaultから設定とってくる
        let getData = dataClass.getData()
        fontType = getData.0
        iconSize = getData.1
        backColor = getData.2
        fontSize = getData.3
        
        view.backgroundColor = UIColor(colorCode: backColor)
        
        //ボタンの初期配置を設定
        setButton()

        // Do any additional setup after loading the view.
        
        /*
        memoSearch.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 10)
        //memoSearch.showsScopeBar = true
        memoSearch.layer.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 10)
        memoSearch.backgroundColor = .white
        memoSearch.placeholder = "検索ワード"
        memoSearch.delegate = self
        view.addSubview(memoSearch)
 */
    }
    
    //ボタンの新規作成
    func makeButton() {
        
        if addBtn {
            let random = CGFloat.random(in: 0 ..< 5)
            
            //ボタン作成
            let makeBtn = CustomUIButton()
            makeBtn.frame = CGRect(x: view.frame.width / 6 * random, y: 0, width: iconSize, height: iconSize)
            makeBtn.layer.cornerRadius = 10
            
            //固有IDを割り振る
            let uuid: String = NSUUID().uuidString
            
            //ボタンのパラメータを設定（UIButtonの拡張部分）
            makeBtn.id = uuid
            makeBtn.title = setTitle
            makeBtn.text = setContentText
            makeBtn.color = setIconColor
            makeBtn.iconCode = iconString
            
            //アイコン色設定
            makeBtn.backgroundColor = UIColor(colorCode: setIconColor)
            
            //アイコン画像設定
            makeBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            let iconImage = UIImage(named: iconString)?.withRenderingMode(.alwaysTemplate)
            makeBtn.setImage(iconImage, for: .normal)
            
            //アイコンの線の色　白か黒か
            let iconColor = DecitionImageColor(UIColor(colorCode: setIconColor))
            makeBtn.tintColor = iconColor
            
            makeBtn.addTarget(self, action: #selector(previewShow), for: .touchUpInside)
            makeBtn.addTarget(self, action: #selector(nextView), for: .touchDownRepeat)
            
            view.addSubview(makeBtn)
            btnArray.append(makeBtn)
            
            makeGravity(sender: btnArray)
            
            addBtn = false
            //CoreDataに新規追加
            coreData.DataAdd(id: uuid, title: setTitle, img: iconString, color: setIconColor, content: setContentText)
        }
        //検索バーを再描画(アイコンボタンを検索バーの裏を通すため)
        view.addSubview(memoSearch)
    }
    
    //検索バーで入力してキーボードのSearchを押したら処理
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //まずキーボードを閉じる
        searchBar.resignFirstResponder()
        self.view.endEditing(true)
        
        //各メモ内のテキストに検索ワードが入ってたらフレームを縁取り
        let searchStr = searchBar.text!
        
        print(searchStr)
        for v in view.subviews {
            if let v = v as? CustomUIButton {
                v.layer.borderWidth = 0.0
                if let str = v.text {
                    if str.caseInsensitiveCompare(searchStr) == .orderedSame {
                        print("Hit!")
                        v.layer.borderColor = UIColor.black.cgColor
                        v.layer.borderWidth = 3.0
                    }
                }
            }
        }
    }
    
    //サーチバーのキーボードにDoneボタン（詳細はMemoTextView・・・内で解説）
    func setToolbarSearchBar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        toolBar.sizeToFit()
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(commitButtonTapped))
        toolBar.items = [spacer, commitButton]
        memoSearch.inputAccessoryView = toolBar
    }
    //キーボードのDoneボタンを押したらキーボード閉じる
    @objc func commitButtonTapped() {
        memoSearch.resignFirstResponder()
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
    
    @objc func previewShow(sender: CustomUIButton) {
        
        let iconImage = UIImage(named: sender.iconCode!)?.withRenderingMode(.alwaysTemplate)
        iconView.image = iconImage
        
        titleLabel.text = sender.title
        textLabel.text = sender.text
        subView.backgroundColor = UIColor(colorCode: sender.color!)
        
        iconView.tintColor = sender.tintColor
        titleLabel.textColor = sender.tintColor
        textLabel.textColor = sender.tintColor
        
        titleLabel.font = UIFont(name: fontType, size: 30)
        textLabel.font = UIFont(name: fontType, size: 15)
        
        logoView.image = nil
        
        titleLabel.adjustsFontForContentSizeCategory = true
    }
    
    //表示画面への遷移
    @objc func nextView(sender: CustomUIButton) {
        
        let vc = MemoTextViewController()
        //let color = sender.backgroundColor
        let tint = sender.tintColor
        
        vc.tintColor = tint!
        vc.backColor = sender.color!
        vc.titleText = sender.title!
        vc.contentText = sender.text!
        vc.fontSize = fontSize
        vc.fontType = fontType
        vc.removeIconDelegate = self
        vc.btnID = sender.id!
        vc.modalPresentationStyle = .formSheet
        vc.preferredContentSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        present(vc, animated: true, completion: nil)
        
        subView.backgroundColor = .black
        titleLabel.text = ""
        textLabel.text = ""
        iconView.image = nil
        let logoImg = UIImage(named: "apple-logo-144")?.withRenderingMode(.alwaysTemplate)
        logoView.image = logoImg
    }
    
    @objc func gotoMakeView(sender: CustomUIButton) {
        let vc = MemoTextViewController()
        //let color = sender.backgroundColor
        let tint = sender.tintColor
        
        vc.makeIconDelegate = self
        
        vc.tintColor = tint!
        vc.backColor = "ffffff"
        vc.titleText = ""
        vc.contentText = ""
        vc.fontType = fontType
        vc.fontSize = fontSize
        vc.makeFlag = true
        vc.modalPresentationStyle = .formSheet
        vc.preferredContentSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        present(vc, animated: true, completion: nil)
    }
    
    let textLabel = UILabel()
    let titleLabel = UILabel()
    let iconView = UIImageView()
    let logoView = UIImageView()

    //ボタンの初期配置
    func setButton() {
        //btnArray初期化
        btnArray.removeAll()
        
        //追加ボタン
        let setBtn = CustomUIButton()
        setBtn.frame.size = CGSize(width: iconSize, height: iconSize)
        setBtn.center = CGPoint(x: view.center.x, y: view.center.y)
        setBtn.backgroundColor = .white
        setBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        setBtn.setImage(UIImage(named: "plus_100"), for: .normal)
        setBtn.layer.cornerRadius = 10.0
        setBtn.addTarget(self, action: #selector(gotoMakeView), for: .touchUpInside)
        btnArray.append(setBtn)
        
        view.addSubview(setBtn)
        
        //CoreDataから読み込み
        inputData = coreData.DataGet()
        
        for i in 0 ..< inputData.count {
            let dataBtn = CustomUIButton()
            dataBtn.id = inputData[i].uuid
            dataBtn.title = inputData[i].title
            dataBtn.text = inputData[i].contentText
            dataBtn.color = inputData[i].color!
            dataBtn.iconCode = inputData[i].img!
            dataBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            let iconImage = UIImage(named: inputData[i].img!)?.withRenderingMode(.alwaysTemplate)
            dataBtn.setImage(iconImage, for: .normal)
            dataBtn.backgroundColor = UIColor(colorCode: inputData[i].color!)
            

            let random = CGFloat.random(in: 0 ..< 5)
            dataBtn.frame = CGRect(x: view.frame.width / 6 * random, y: 0, width: iconSize, height: iconSize)
            dataBtn.layer.cornerRadius = 10
            let iconColor = DecitionImageColor(UIColor(colorCode: inputData[i].color!))
            dataBtn.tintColor = iconColor
            
            //dataBtn.addTarget(self, action: #selector(nextView), for: .touchUpInside)
            dataBtn.addTarget(self, action: #selector(previewShow), for: .touchUpInside)
            dataBtn.addTarget(self, action: #selector(nextView), for: .touchDownRepeat)
            
            view.addSubview(dataBtn)
            btnArray.append(dataBtn)
        }
        
        //必ずview.addSubviewが先
        //makeGravity(sender: btnArray)
        
        //************************プレビューエリア*****************************
        
        //プレビューエリア
        subView.frame = CGRect(x: 0, y: 0, width: width, height: height / 10 * 2.5)
        subView.backgroundColor = .black
        
        //アイコン

        
        iconView.frame = CGRect(x: 25, y: 0, width: width / 6, height: width / 6)
        //iconView.frame.size = CGSize(width: width / 5, height: width / 5)
        iconView.center.y = subView.frame.height / 2
        //let iconImage = UIImage(named: "kodi")?.withRenderingMode(.alwaysTemplate)
        //iconView.image = iconImage
        iconView.tintColor = .white
        
        //タイトル
        titleLabel.frame = CGRect(x: width / 6 * 2, y: 0, width: width / 6 * 4, height: height / 10 * 1.5)
        //titleLabel.backgroundColor = .black
        titleLabel.textColor = .white
        //titleLabel.text = "Title"
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont(name: fontType, size: fontSize)
        
        //テキスト
        
        textLabel.frame = CGRect(x: width / 6 * 2, y: height / 10 * 1.5, width: width / 6 * 4, height: height / 10)
        //textLabel.backgroundColor = .gray
        //textLabel.text = "text"
        textLabel.adjustsFontForContentSizeCategory = true
        textLabel.textColor = .white
        textLabel.numberOfLines = 0
        
        view.addSubview(subView)
        subView.addSubview(iconView)
        subView.addSubview(titleLabel)
        subView.addSubview(textLabel)
        
        //初期ロゴ配置
        
        logoView.frame.size = CGSize(width: subView.frame.height / 2, height: subView.frame.height / 2)
        logoView.center = CGPoint(x: subView.frame.width / 2, y: subView.frame.height / 2)
        let logoImg = UIImage(named: "apple-logo-144")?.withRenderingMode(.alwaysTemplate)
        logoView.image = logoImg
        subView.addSubview(logoView)
    }
    
    func makeGravity(sender: [CustomUIButton]) {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior(items: sender)
        
        let collision = UICollisionBehavior(items: sender)
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: CGRect(x: 0, y:0, width: view.frame.width, height: view.frame.height - tabbarHeight)
        ))
        animator.addBehavior(collision)
        animator.addBehavior(gravity)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
