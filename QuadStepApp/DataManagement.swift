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
    func DataAdd(saveData: HomeData) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let data = HomeData(context: context)
        
        data.uuid = saveData.uuid
        data.title = saveData.title
        data.img = saveData.img
        data.color = saveData.color
        data.contentText = saveData.contentText
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    //指定データ更新
    func DataUpdate(saveData: HomeData){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<HomeData> = HomeData.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            
            for num in 0 ..< result.count {
                if result[num].uuid == saveData.uuid {
                    result[num].title = saveData.title
                    result[num].img = saveData.img
                    result[num].color = saveData.color
                    result[num].contentText = saveData.contentText
                    
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
