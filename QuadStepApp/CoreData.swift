//
//  CoreData.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/27.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit
import CoreData

class CoreDataSet {
    
    //セーブデータ格納用
    var homeData = HomeData()
    var homeDataArray: [HomeData] = []
    
    //ホームデータ取得
    func GetHomeData() {
        
    }
    
    
    //ホームデータセーブ
    
    
    
    //テキストデータ取得
    
    
    
    //テキストデータセーブ
    
    
    
    
    /*
     //CoreDataからデータを取ってくる
     func getData() {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
         do {
             let fetchequest: NSFetchRequest<SaveData> = SaveData.fetchRequest()
             inputData = try context.fetch(fetchequest)
             
         }catch {
             print("error")
         }
         
         print("\(inputData.count)件のデータを取得しました")
     }
     
     
     */
}
