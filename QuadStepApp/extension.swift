//
//  extension.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/02/03.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

extension UITextField {
    // キーボード表示時にDoneボタンを付与する。
    func addDoneButtonWithKeybord() {
        // 仮のサイズでツールバー生成
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        kbToolBar.barStyle = .default  // スタイルを設定

        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更

        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)

        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(UITextField.commitButtonTapped))

        kbToolBar.items = [spacer, commitButton]

        self.inputAccessoryView = kbToolBar
    }

    // 閉じるボタンを付与
    @objc func commitButtonTapped (){
        self.resignFirstResponder()
    }
}
