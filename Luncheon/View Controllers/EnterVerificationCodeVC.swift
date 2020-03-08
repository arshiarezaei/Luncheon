//
//  EnterVerificationCodeVC.swift
//  Luncheon
//
//  Created by Arshiya on 12/17/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class EnterVerificationCodeVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
//        self.navigationItem.backBarButtonItem?.title = "بازگشت"
        self.view.backgroundColor = .red
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let backBarBtnItem = UIBarButtonItem()
//        backBarBtnItem.title = "back"
//        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
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
