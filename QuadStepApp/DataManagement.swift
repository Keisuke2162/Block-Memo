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
    
    
    func getData() -> (String, CGFloat, String, CGFloat){
        
        
        
        //var strFont: String = ""
        //var iconSize: CGFloat = 0.0
        //var backGround: UIColor
        
        userDefault.register(defaults: ["FontSet": "AppleSDGothicNeo-Thin"])
        userDefault.register(defaults: ["IconSize" : 75.0])
        userDefault.register(defaults: ["BackColor" : "67a5da"])
        userDefault.register(defaults: ["fontSize" : 25.0])
        
        let strFont = userDefault.object(forKey: "FontSet") as! String
        let iconSize = userDefault.object(forKey: "IconSize") as! CGFloat
        let backGround = userDefault.object(forKey: "BackColor") as! String
        let fontSize = userDefault.object(forKey: "fontSize") as! CGFloat
        
        print("フォント→\(strFont),サイズ→\(iconSize),カラー→\(backGround)を読み込みました")
        
        return (strFont, iconSize, backGround, fontSize)
    }
    
    func putData(strFont: String, iconSize: CGFloat, backColor: String, fontSize: CGFloat) {
        print("フォント→\(strFont),サイズ→\(iconSize),カラー→\(backColor)を保存します")
        
        userDefault.set(strFont, forKey: "FontSet")
        userDefault.set(iconSize, forKey: "IconSize")
        userDefault.set(backColor, forKey: "BackColor")
        userDefault.set(fontSize, forKey: "fontSize")
    }
}

class CoreDataManagement {
    //セーブデータ格納用
    var inputData: [HomeData] = []
    //var saveData = HomeData()
    
    
    //CoreDataからデータを取ってくる
    func DataGet() -> ([HomeData]){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let fetchequest: NSFetchRequest<HomeData> = HomeData.fetchRequest()
            inputData = try context.fetch(fetchequest)
            
        }catch {
            print("error")
        }
        
        print("\(inputData.count)件のデータを取得しました")
        return inputData
    }
    
    //CoreDataのデータを全削除
    func AllDataDelete() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<HomeData> = HomeData.fetchRequest()
        do{
            let task = try context.fetch(fetchRequest)
            for i in 0..<task.count {
                context.delete(task[i])
            }
        }catch {
            print("error")
        }
    }
    
    //データ追加
    //func DataAdd(saveData: HomeData) {
    func DataAdd(id: String, title: String, img: String, color: String, content: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let data = HomeData(context: context)
        
        data.uuid = id
        data.title = title
        data.img = img
        data.color = color
        data.contentText = content
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    //指定データ更新
    func DataUpdate(updateId: String, updateTitle: String, updateText: String, updateColor: String, updateIconCode: String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<HomeData> = HomeData.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            
            for num in 0 ..< result.count {
                if result[num].uuid == updateId {
                    result[num].title = updateTitle
                    //result[num].img = saveData.img
                    result[num].color = updateColor
                    result[num].contentText = updateText
                    result[num].img = updateIconCode
                    
                    break
                }
            }
            try context.save()
        }catch {
            print("error")
        }
    }
 
    //指定データ削除
    func DataDelete(deleteID: String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<HomeData> = HomeData.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            
            for num in 0 ..< result.count {
                if result[num].uuid == deleteID {
                    context.delete(result[num])
                    
                    break
                }
            }
            try context.save()
        }catch {
            print("error")
        }
    }
}
