//
//  SignUpVC.swift
//  Luncheon
//
//  Created by Arshiya on 12/15/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class SignUpVC: UINavigationController {
    
    
    private let mobileNumber:String? = nil

  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.view.backgroundColor = .whiteBackgroud
        navigationBar.backgroundColor = .whiteBackgroud
//        self.view.semanticContentAttribute = .forceRightToLeft
        self.navigationBar.isHidden = false
        self.show(EnterMobileNumberVC(), sender: self)

    }
    

    
}
