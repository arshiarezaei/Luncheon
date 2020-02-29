//
//  ProfileViewController.swift
//  Luncheon
//
//  Created by Arshiya on 12/9/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserStates.currentState == .LoggedOut ? self.view = LoginOrSignUpView(frame: view.frame) : ()
        view.backgroundColor = .whiteBackgroud
        
    }
    
}
