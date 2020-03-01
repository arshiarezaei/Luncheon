//
//  NavigationController.swift
//  Luncheon
//
//  Created by Arshiya on 12/7/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        navigationBar.topItem?.titleView = UIImageView(image: UIImage(named: "Luncheon logo"))
        NotificationCenter.default.addObserver(self, selector: #selector(loginButtonTapped), name: .loginButtonTapped, object: nil)
        // Do any additional setup after loading the view.
    }
    @objc private func loginButtonTapped() {
     debugPrint("Notif : loginButtonTapped received")
     self.present(LoginVC(), animated: true, completion: nil)
        
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
