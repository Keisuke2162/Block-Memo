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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(colorCode: "829ac8")
        
        setButton()

        // Do any additional setup after loading the view.
    }
    
    func setButton() {
        let decBtn = UIButton()
        decBtn.backgroundColor = .white
        //decBtn.frame = CGRect(x: view.frame.width - 40, y: 10, width: 30, height: 30)
        decBtn.frame = CGRect(x: view.center.x - 30, y: view.center.y, width: 60, height: 30)
        decBtn.layer.cornerRadius = 15.0
        decBtn.setTitle("done", for: .normal)
        decBtn.setTitleColor(.blue, for: .normal)
        
        decBtn.addTarget(self, action: #selector(doneIcon), for: .touchUpInside)
        
        view.addSubview(decBtn)
    }
    
    @objc func doneIcon() {
        //let preVC = self.presentingViewController as! HomeViewController
        //preVC.addBtn = true
        //let preVC = self.presentingViewController as? UITabBarController
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

