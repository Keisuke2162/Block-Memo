//
//  MenuModalViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/26.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

protocol MakeButtonActionDelegate {
    func startMakeButton()
}

class MenuModalViewController: UIViewController {
    
    var delegate: MakeButtonActionDelegate?
    
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    //メモの種類ボタン
    let textBtn = UIButton()
    let todoBtn = UIButton()
    let listBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        height = view.frame.height
        width = view.frame.width
        
        view.backgroundColor = UIColor(colorCode: "829ac8")
        
        setButton()

        // Do any additional setup after loading the view.
    }
    
    func setButton() {
        //確定ボタン１
        let decBtn1 = UIButton()
        decBtn1.backgroundColor = .white
        //decBtn1.frame = CGRect(x: view.center.x - 30, y: view.center.y - 15, width: 60, height: 30)
        //decBtn1.frame = CGRect(x: view.center.x - 30, y: view.frame.maxY - 100, width: 60, height: 30)
        decBtn1.frame.size = CGSize(width: 60, height: 30)
        decBtn1.center = view.center
        decBtn1.layer.cornerRadius = 15.0
        decBtn1.setTitle("done", for: .normal)
        decBtn1.setTitleColor(.blue, for: .normal)
        
        decBtn1.addTarget(self, action: #selector(doneIcon), for: .touchUpInside)
        view.addSubview(decBtn1)
        
        //確定ボタン２
        /*
        let decBtn2 = UIButton()
        decBtn2.backgroundColor = .white
        decBtn2.frame = CGRect(x: width - 70, y: 10, width: 60, height: 30)
        decBtn2.layer.cornerRadius = 15.0
        decBtn2.setTitle("done", for: .normal)
        decBtn2.setTitleColor(.blue, for: .normal)
        
        decBtn2.addTarget(self, action: #selector(doneIcon), for: .touchUpInside)
        view.addSubview(decBtn2)
        */
        
        
        //タイトル入力フィールド（UITextFieldのカスタムクラス（Doneボタンの追加））
        let titleField = CustomTextField()
        titleField.borderStyle = .none
        titleField.frame.size = CGSize(width: width / 10 * 6, height: height / 10)
        titleField.center = CGPoint(x: view.center.x, y: height / 10)
        titleField.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 50.0)
        
        let border = CALayer()
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: titleField.frame.size.height - 2.0, width: titleField.frame.size.width, height: 1)
        border.borderWidth = 2.0
        
        titleField.layer.addSublayer(border)
        view.addSubview(titleField)
        
        //
        textBtn.frame = CGRect(x: width / 10 * 2, y: height / 10 * 2, width: width / 10, height: width / 10)
        textBtn.setImage(UIImage(named: "text"), for: .normal)
        
        view.addSubview(textBtn)
        
        //
        todoBtn.frame = CGRect(x: width / 10 * 4.5, y: height / 10 * 2, width: width / 10, height: width / 10)
        todoBtn.setImage(UIImage(named: "todo"), for: .normal)
        
        view.addSubview(todoBtn)
        
        //
        listBtn.frame = CGRect(x: width / 10 * 7, y: height / 10 * 2, width: width / 10, height: width / 10)
        listBtn.setImage(UIImage(named: "list"), for: .normal)
        
        view.addSubview(listBtn)
    }
    
    @objc func doneIcon() {
        //let id: String = NSUUID().uuidString
        
        self.dismiss(animated: true, completion: {
            if let del = self.delegate {
                del.startMakeButton()
            } else {
                print("unwrap error")
            }
        })
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

