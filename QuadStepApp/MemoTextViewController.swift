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
    
    //2ページ目のパーツ
    var secondView = UIView()
    let imageBtn = CustomUIButton()
    let deleteBtn = CustomUIButton()
    let colorBtn = CustomUIButton()
    
    //アイコン一覧を表示するView
    let iconScroll = UIScrollView()
    
    let iconPopular: [String] = ["icons8-bookmark-100", "icons8-edit-100", "icons8-search-100", "icons8-document-100", "icons8-opened-folder-100",      "icons8-support-100", "icons8-facebook-old-100","icons8-instagram-100", "icons8-twitter-100", "icons8-clock-100", "icons8-lock-100", "icons8-news-100", "icons8-speech-bubble-100", "icons8-music-100", "icons8-cancer-100"]
    //let iconAstrogy: [String] = ["icons8-leo-100", "icons8-libra-100", "icons8-aquarius-100", "icons8-aries-100", "icons8-pisces-100", "icons8-scorpio-100", "icons8-virgo-100", "icons8-capricorn-100", "icons8-sagittarius-100", "icons8-taurus-100", "icons8-gemini-100"]
    let iconBusiness: [String] = ["icons8-agreement-100", "icons8-answers-100", "icons8-bonds-100", "icons8-bad-idea-100", "icons8-idea-bank-100", "icons8-internet-100","icons8-inspection-100","icons8-questionnaire-100", "icons8-to-do-100", "icons8-doughnut-chart-100", "icons8-terms-and-conditions-100"]
    let iconCinema: [String] = ["icons8-kicking-100", "icons8-attack-100", "icons8-comet-100", "icons8-galaxy-100", "icons8-planet-100","icons8-shooting-stars-100","icons8-punching-100"]
    let iconCity: [String] = ["icons8-airport-100", "icons8-ferris-wheel-100", "icons8-city-100", "icons8-cafe-100", "icons8-meal-100","icons8-confetti-100", "icons8-roller-coaster-100","icons8-tire-swing-100","icons8-reserve-100",
        "icons8-cinema-100", "icons8-restaurant-100"]
    
    let iconAnimal: [String] = ["icons8-bird-100","icons8-border-collie-100","icons8-bream-100","icons8-camel-100","icons8-chicken-100","icons8-dolphin-100","icons8-dove-100","icons8-duck-100","icons8-elephant-100","icons8-flying-duck-100","icons8-full-body-crow-100","icons8-giraffe-full-body-100","icons8-gorilla-100","icons8-hedgehog-100","icons8-horse-100","icons8-kangaroo-100","icons8-koala-100","icons8-manatee-100","icons8-octopus-100","icons8-orca-100","icons8-owl-100","icons8-penguin-100","icons8-pet-commands-stay-100","icons8-pig-100","icons8-seal-100","icons8-squirrel-100","icons8-stingray-100","icons8-whale-100","icons8-woodpecker-100"]
    let iconCulture: [String] = ["icons8-angel-with-sword-100","icons8-ankh-100","icons8-anubis-100","icons8-balance-symbol-100","icons8-basilica-100","icons8-berlin-tv-tower-100","icons8-bull-100","icons8-cross-100","icons8-da-vinci-100","icons8-dali-100","icons8-double-decker-bus-100","icons8-easel-100","icons8-edvard-munch-100","icons8-german-hat-100","icons8-golden-fever-100","icons8-greek-helmet-100","icons8-katana-100","icons8-kawaii-bread-100","icons8-kawaii-broccoli-100","icons8-kawaii-coffee-100","icons8-kawaii-croissant-100","icons8-kawaii-cupcake-100","icons8-kawaii-dinosaur-100","icons8-kawaii-egg-100","icons8-kawaii-french-fries-100","icons8-kawaii-ice-cream-100","icons8-kawaii-milk-100","icons8-kawaii-noodle-100","icons8-kawaii-soda-100","icons8-kimono-100","icons8-lion-head-100","icons8-louvre-pyramid-100","icons8-moon-star-100","icons8-origami-100","icons8-pagoda-100","icons8-peace-pigeon-100","icons8-pentagram-devil-100","icons8-pyramids-100","icons8-red-fort-100","icons8-rodeo-100","icons8-sagrada-familia-100","icons8-salmon-sushi-100","icons8-sikh-100","icons8-taj-mahal-100","icons8-third-eye-symbol-100","icons8-thor-hammer-100","icons8-tiananmen-100","icons8-tomahawk-100","icons8-tower-of-pisa-100","icons8-tribal-symbols-100","icons8-triumphal-arch-100","icons8-trojan-horse-100","icons8-viking-helmet-100","icons8-viking-ship-100","icons8-yin-yang-100"]
    let iconDIY: [String] = ["icons8-chainsaw-100","icons8-drill-100","icons8-garden-shears-100","icons8-hammer-100","icons8-paint-bucket-100","icons8-screwdriver-100","icons8-sickle-100","icons8-spade-100","icons8-wheelbarrow-100","icons8-yard-work-100"]
    let iconDrink: [String] = ["icons8-beer-100","icons8-bottle-cap-100","icons8-cafe-100","icons8-champagne-bottle-100","icons8-cocktail-100","icons8-coconut-cocktail-100","icons8-coffee-pot-100","icons8-coffee-to-go-100","icons8-cola-100","icons8-cup-with-straw-100","icons8-soda-100","icons8-sport-bottle-100","icons8-tea-100","icons8-vodka-100","icons8-wine-bottle-100","icons8-wine-glass-100","icons8-wooden-beer-keg-100"]
    let iconFood: [String] = ["icons8-banana-100","icons8-carrot-100","icons8-cherry-100","icons8-egg-stand-100","icons8-fish-and-vegetables-100","icons8-healthy-eating-100","icons8-lime-100","icons8-noodles-100","icons8-orange-100","icons8-pear-100","icons8-salami-pizza-100","icons8-spam-can-100","icons8-steak-very-hot-100","icons8-thanksgiving-100","icons8-tomato-100","icons8-watermelon-100"]
    let iconGaming: [String] = ["icons8-ace-of-hearts-100","icons8-ace-of-spades-100","icons8-archer-100","icons8-clubs-100","icons8-defense-100","icons8-diamonds-100","icons8-dice-100","icons8-explosive-100","icons8-heart-outline-100","icons8-joker-100","icons8-king-of-diamonds-100","icons8-knight-100","icons8-mana-100","icons8-minecraft-sword-100","icons8-pacman-100","icons8-queen-100","icons8-queen-of-diamonds-100","icons8-rook-100","icons8-shield-100","icons8-slot-machine-100","icons8-spades-100","icons8-submachine-gun-100","icons8-tetris-100"]
    let iconMaps: [String] = ["icons8-address-100","icons8-around-the-globe-100","icons8-asia-100","icons8-compass-south-100","icons8-globe-earth-100","icons8-gps-signal-100","icons8-location-100","icons8-map-marker-100","icons8-marker-100","icons8-marker-storm-100","icons8-marker-sun-100","icons8-signpost-100","icons8-world-map-100"]
    let iconMusic: [String] = ["icons8-bass-drum-100","icons8-bugle-100","icons8-circled-play-100","icons8-cornet-100","icons8-dj-100","icons8-drum-set-100","icons8-french-horn-100","icons8-guitar-100","icons8-international-music-100","icons8-lullaby-100","icons8-metal-music-100","icons8-micro-100","icons8-microphone-100","icons8-musical-100","icons8-musical-notes-100","icons8-oud-100","icons8-powwow-drum-100","icons8-punk-100","icons8-r'n'b-100","icons8-rock-music-100","icons8-saxophone-100","icons8-tex-mex-100","icons8-tuba-100"]
    let iconSports: [String] = ["icons8-archers-arrow-100","icons8-badminton-100","icons8-baseball-100","icons8-basketball-100","icons8-beach-100","icons8-bowling-pins-100","icons8-forest-100","icons8-horseback-riding-100","icons8-island-on-water-100","icons8-olympic-torch-100","icons8-ping-pong-100","icons8-rugby-100","icons8-tennis-ball-100","icons8-tennis-racquet-100","icons8-trotting-horse-100"]

    var iconListArray: [[String]] = []
    
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
        // Do any additional setup after loading the view.
        
        print("MemoTextViewController - viewDidLoad")
        
        //色配列をまとめ
        colorArray = [red, orange, yellow, yellowGreen, green, blueGreen, aquaSky, blue, indigo, violet,
                      magenta, pink, brown, blackWhite, gold, silver]
        
        //アイコン配列をまとめ
        iconListArray = [iconPopular, iconBusiness, iconCinema, iconCity, iconAnimal, iconCulture, iconDIY, iconDrink, iconFood, iconGaming, iconMaps, iconMusic, iconSports]
        
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
        decBtn1.frame = CGRect(x: width - 80, y: height - 120, width: 120, height: 120)
        decBtn1.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 60, right: 60)
        decBtn1.layer.cornerRadius = 60
        decBtn1.setImage(decIcon, for: .normal)
        decBtn1.tintColor = .white
        decBtn1.addTarget(self, action: #selector(doneIcon), for: .touchUpInside)
        decBtn1.backgroundColor = .black
        view.addSubview(decBtn1)
        
        //新規作成の場合は確定ボタン,閲覧の場合は削除ボタンを配置
        if makeFlag {
            deleteBtn.isHidden = true
            decBtn1.isHidden = false
            iconCode = ""
        } else {
            decBtn1.isHidden = true
            deleteBtn.isHidden = false
        }
        
        pageScrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    //ホーム画面に戻る時の処理
    override func viewDidDisappear(_ animated: Bool) {
        titleText = titleField.text!
        contentText = textView.text
        
        print("update icon-> \(iconCode)")
        
        if makeFlag {
            print("retnrnView")
        } else {
            if let del  = self.removeIconDelegate {
                del.updateIcon(updateId: btnID, updateTitle: titleText, updateText: contentText, updateColor: backColor, updateImage: iconCode)
            } else {
                print("unwrap error")
            }
        }
    }
    /*
    override func viewdiddis(_ animated: Bool) {

    }
    */
    
    func TintcolorUpdate() {
        
        deleteBtn.tintColor = tintColor
        colorBtn.tintColor = tintColor
        imageBtn.tintColor = tintColor
        textView.textColor = tintColor
        titleField.textColor = tintColor
        
        iconFrameLabel.layer.borderColor = tintColor.cgColor
        
        decBtn1.backgroundColor = tintColor
        
        for v in iconScroll.subviews {
            if let v = v as? CustomUIButton {
                v.tintColor = tintColor
            }
        }
        
        /*
        for i in 0 ..< iconScroll.subviews.count {
            iconScroll.subviews[i].tintColor = tintColor
        }
 */
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

        decBtn1.tintColor = UIColor(colorCode: backColor)
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
        
        self.dismiss(animated: true, completion: {
            if let del = self.makeIconDelegate {
                titleText = self.titleField.text!
                contentText = self.textView.text!
                
                del.startMakeButton(title: titleText, contentText: contentText, iconColor: self.backColor, iconName: self.iconCode)
            } else {
                print("unwrap error")
            }
        })
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


}

extension MemoTextViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(pageScrollView.contentOffset.x / pageScrollView.frame.width)
    }
}
