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
        
        // Do any additional setup after loading the view.
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
