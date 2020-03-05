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

    }
}
