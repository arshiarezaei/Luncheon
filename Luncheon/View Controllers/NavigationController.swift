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

    }
    
}
