//
//  DataManagement.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/02/21.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class GeneralDataManagement {
    
    let userDefault = UserDefaults.standard
    //User Defaultから取得　＆　UserDefaultに保存する値
    //var strFont: String = ""
    //var iconSize: CGFloat = 0.0
    
    
    func getData() -> (String, CGFloat){
        
        var strFont: String = ""
        var iconSize: CGFloat = 0.0
        
        userDefault.register(defaults: ["FontSet": "AppleSDGothicNeo-Thin"])
        userDefault.register(defaults: ["IconSize" : 0.0])
        
        strFont = userDefault.object(forKey: "FontSet") as! String
        iconSize = userDefault.object(forKey: "IconSize") as! CGFloat
        
        print("フォント→\(strFont),サイズ→\(iconSize)を読み込みました")
        
        return (strFont, iconSize)
    }
    
    func putData(strFont: String, iconSize: CGFloat) {
        print("フォント→\(strFont),サイズ→\(iconSize)を保存します")
        
        userDefault.set(strFont, forKey: "FontSet")
        userDefault.set(iconSize, forKey: "IconSize")
    }
}

class CoreDataManagement {
    
}
