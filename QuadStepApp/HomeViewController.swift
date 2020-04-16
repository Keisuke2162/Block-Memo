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
    func updateIcon(updateId: String, updateTitle: String, updateText: String, updateColor: String, updateImage: String) {
        //view上のsubViewの中からボタンかつ設定IDでが一致したものをターゲット
        let iconImage = UIImage(named: updateImage)?.withRenderingMode(.alwaysTemplate)
        
        for v in view.subviews {
            if let v = v as? CustomUIButton, v.id == updateId {
                v.title = updateTitle
                v.text = updateText
                v.color = updateColor
                v.iconCode = updateImage
                v.setImage(nil, for: .normal)
                v.setImage(iconImage, for: .normal)
                v.backgroundColor = UIColor(colorCode: updateColor)
                v.tintColor = DecitionImageColor(UIColor(colorCode: updateColor))
            }
        }
        coreData.DataUpdate(updateId: updateId, updateTitle: updateTitle, updateText: updateText, updateColor: updateColor, updateIconCode: updateImage)
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
    
    //プレビュー表示用()
    private var pageScrollView = UIScrollView()
    private var pageControll = UIPageControl()
    private var pageNum: Int!
    let previewBtn = CustomUIButton()
    
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
    
    //メモ閲覧・メモ作成画面
    let vc = MemoTextViewController()
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        //userDefaultから設定とってくる（設定画面から返ってきた時に通る）
        let getData = dataClass.getData()
        fontType = getData.0
        iconSize = getData.1
        backColor = getData.2
        fontSize = getData.3
        
        view.backgroundColor = UIColor(colorCode: backColor)
        
    }
    
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

        // Do any additional setup after loading the view.d
        
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
            makeBtn.imageEdgeInsets = UIEdgeInsets(top: iconSize / 3.5, left: iconSize / 3.5, bottom: iconSize / 3.5, right: iconSize / 3.5)
            let iconImage = UIImage(named: iconString)?.withRenderingMode(.alwaysTemplate)
            makeBtn.setImage(iconImage, for: .normal)
            
            //アイコンの線の色　白か黒か
            let iconColor = DecitionImageColor(UIColor(colorCode: setIconColor))
            makeBtn.tintColor = iconColor
            
            //makeBtn.addTarget(self, action: #selector(previewShow), for: .touchUpInside)
            makeBtn.addTarget(self, action: #selector(nextView), for: .touchUpInside)
            
            view.addSubview(makeBtn)
            btnArray.append(makeBtn)
            
            makeGravity(sender: btnArray)
            
            addBtn = false
            //CoreDataに新規追加
            coreData.DataAdd(id: uuid, title: setTitle, img: iconString, color: setIconColor, content: setContentText)
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
    
    
    
    //表示画面への遷移
    @objc func nextView(sender: CustomUIButton) {
        
        //let vc = MemoTextViewController()
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
        vc.makeFlag = false
        vc.iconCode = sender.iconCode!
        vc.modalPresentationStyle = .fullScreen
        vc.preferredContentSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        present(vc, animated: true, completion: nil)
    }
    
    //新規作成画面への遷移処理
    @objc func gotoMakeView(sender: CustomUIButton) {
        //let vc = MemoTextViewController()
        //let color = sender.backgroundColor
        let tint = sender.tintColor
        
        vc.makeIconDelegate = self
        
        vc.tintColor = tint!
        vc.backColor = "ffffff"
        vc.titleText = ""
        vc.contentText = ""
        vc.fontType = fontType
        vc.fontSize = fontSize
        vc.iconCode = ""
        vc.makeFlag = true
        vc.modalPresentationStyle = .fullScreen
        vc.preferredContentSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        present(vc, animated: true, completion: nil)
    }


    //ボタンの初期配置
    func setButton() {
        //btnArray初期化
        btnArray.removeAll()
        
        //追加ボタン
        let setBtn = CustomUIButton()
        setBtn.frame.size = CGSize(width: iconSize, height: iconSize)
        setBtn.center = CGPoint(x: view.center.x, y: view.center.y)
        setBtn.backgroundColor = .white
        setBtn.imageEdgeInsets = UIEdgeInsets(top: iconSize / 3.5, left: iconSize / 3.5, bottom: iconSize / 3.5, right: iconSize / 3.5)
        setBtn.setImage(UIImage(named: "plus_100"), for: .normal)
        setBtn.layer.cornerRadius = 10.0
        setBtn.addTarget(self, action: #selector(gotoMakeView), for: .touchUpInside)
        btnArray.append(setBtn)
        
        view.addSubview(setBtn)
        
        //プレビューエリア
        previewBtn.frame.size = CGSize(width: width * 0.9, height: height * 0.1)
        previewBtn.center = CGPoint(x: width / 2, y: height * 0.7)
        previewBtn.layer.cornerRadius = 10.0
        previewBtn.backgroundColor = .white
        
        
        //CoreDataから読み込み
        inputData = coreData.DataGet()

        
        for i in 0 ..< inputData.count {
            let dataBtn = CustomUIButton()
            dataBtn.id = inputData[i].uuid
            dataBtn.title = inputData[i].title
            dataBtn.text = inputData[i].contentText
            dataBtn.color = inputData[i].color!
            dataBtn.iconCode = inputData[i].img!
            dataBtn.imageEdgeInsets = UIEdgeInsets(top: iconSize / 3.5, left: iconSize / 3.5, bottom: iconSize / 3.5, right: iconSize / 3.5)
            let iconImage = UIImage(named: inputData[i].img!)?.withRenderingMode(.alwaysTemplate)
            dataBtn.setImage(iconImage, for: .normal)
            dataBtn.backgroundColor = UIColor(colorCode: inputData[i].color!)
            
            let sizeValue = width / iconSize
            let random = CGFloat.random(in: 0 ..< sizeValue)
            dataBtn.frame = CGRect(x: view.frame.width / (sizeValue + 1.0) * random, y: -(view.frame.height / sizeValue * random), width: iconSize, height: iconSize)
            
            dataBtn.layer.cornerRadius = 10
            let iconColor = DecitionImageColor(UIColor(colorCode: inputData[i].color!))
            dataBtn.tintColor = iconColor
            
            dataBtn.addTarget(self, action: #selector(nextView), for: .touchUpInside)
            
            view.addSubview(dataBtn)
            btnArray.append(dataBtn)
            
            let subArea = UIView()
            subArea.frame = CGRect(x: previewBtn.frame.width * CGFloat(i + 1), y: 0, width: previewBtn.frame.width, height: previewBtn.frame.height)
            subArea.backgroundColor = UIColor(colorCode: inputData[i].color!)
            
            let subImage = UIImageView()
            subImage.frame.size = CGSize(width: subArea.frame.height * 0.5, height: subArea.frame.height * 0.5)
            subImage.center = CGPoint(x: subArea.frame.height * 0.5, y: subArea.frame.height / 2)
            subImage.image = iconImage
            subImage.tintColor = iconColor
            
            let titleLabel = UILabel()
            titleLabel.frame = CGRect(x: subArea.frame.height, y: 0, width: subArea.frame.width - (subArea.frame.height), height: subArea.frame.height)
            titleLabel.text = inputData[i].title
            titleLabel.font = UIFont(name: fontType, size: fontSize)
            titleLabel.textColor = iconColor
            
            subArea.addSubview(titleLabel)
            subArea.addSubview(subImage)
            pageScrollView.addSubview(subArea)
        }
        
        view.addSubview(previewBtn)
        btnArray.append(previewBtn)
        
        //プレビューのページ設定
        pageScrollView.frame = CGRect(x: 0, y: 0, width: previewBtn.frame.width, height: previewBtn.frame.height)
        pageScrollView.contentSize = CGSize(width: previewBtn.frame.width * CGFloat(btnArray.count - 1), height: previewBtn.frame.height)
        pageScrollView.delegate = self
        pageScrollView.isPagingEnabled = true
        pageScrollView.showsHorizontalScrollIndicator = false
        pageScrollView.layer.cornerRadius = 10.0
        
        pageControll.frame = CGRect(x: 0, y: pageScrollView.frame.height - 10, width: pageScrollView.frame.width, height: 5)
        pageControll.numberOfPages = btnArray.count - 1
        pageControll.pageIndicatorTintColor = view.backgroundColor
        pageControll.currentPageIndicatorTintColor = .black
        
        previewBtn.addSubview(pageScrollView)
        previewBtn.addSubview(pageControll)

        
    }
    
    func makeGravity(sender: [CustomUIButton]) {
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: sender)
        
        let collision = UICollisionBehavior(items: sender)
        collision.translatesReferenceBoundsIntoBoundary = false
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: CGRect(x: 0, y: 0 - view.frame.height, width: view.frame.width, height: view.frame.height - tabbarHeight + view.frame.height)
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


extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(pageScrollView.contentOffset.x / pageScrollView.frame.width)
    }
}
 
