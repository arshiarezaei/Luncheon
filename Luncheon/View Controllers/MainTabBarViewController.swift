//
//  MainTabBarViewController.swift
//  Luncheon
//
//  Created by Arshiya on 12/6/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tabBar.tintColor = .luncehonLogoText
        let fontAttributes = [NSAttributedString.Key.font: UIFont.BYekan]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        NotificationCenter.default.addObserver(self, selector: #selector(loginButtonTapped), name: .loginButtonTapped, object: nil)
        // Do any additional setup after loading the view.
    }
    @objc private func loginButtonTapped() {
        debugPrint("Notif : loginButtonTapped received")
           
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
