//
//  ViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/23.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var height: CGFloat = 0
    var width: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //画面の縦横サイズを取得
        height = view.bounds.height
        width = view.bounds.width
        
        
        //部品のセット
        setItems()
    }
    
    func setItems() {
        
        /************ToolBar**********************/
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: height / 10 * 9, width: view.bounds.width, height: height / 10)
        toolBar.backgroundColor = .blue
        toolBar.barStyle = .default
        
        //bar内のボタンたち
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        let actBtn = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        let edtBtn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let barItems = [flexibleSpace, addBtn, flexibleSpace, actBtn, flexibleSpace, edtBtn, flexibleSpace]
        toolBar.items = barItems
        
        view.addSubview(toolBar)
        /***************************************/
    }


}

