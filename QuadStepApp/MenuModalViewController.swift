//
//  MenuModalViewController.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2020/01/26.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class MenuModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        setButton()

        // Do any additional setup after loading the view.
    }
    
    func setButton() {
        let decBtn = UIButton()
        decBtn.backgroundColor = .white
        decBtn.frame = CGRect(x: view.frame.width - 80, y: 20, width: 60, height: 30)
        decBtn.layer.cornerRadius = 10.0
        decBtn.setTitle("Done", for: .normal)
        decBtn.setTitleColor(.blue, for: .normal)
        
        decBtn.addTarget(self, action: #selector(doneIcon), for: .touchUpInside)
        
        view.addSubview(decBtn)
    }
    
    @objc func doneIcon() {
        
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
