//
//  MemoTextViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/02/05.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class MemoTextViewController: UIViewController {
    
    var backColor: UIColor = .white

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = backColor
        
        setParts()
    }
    
    func setParts() {
        let returnBtn = UIButton()
        returnBtn.frame.size = CGSize(width: 60, height: 30)
        returnBtn.center = view.center
        returnBtn.backgroundColor = .white
        returnBtn.setTitle("return", for: .normal)
        returnBtn.addTarget(self, action: #selector(tappedReturn), for: .touchUpInside)
        
        view.addSubview(returnBtn)
    }
    
    @objc func tappedReturn() {
        dismiss(animated: true, completion: nil)
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
