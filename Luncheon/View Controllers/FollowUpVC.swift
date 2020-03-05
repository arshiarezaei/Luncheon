//
//  FollowUpVC.swift
//  Luncheon
//
//  Created by Arshiya on 12/15/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class FollowUpVC: UIViewController {
    private let navBar : UINavigationBar = UINavigationBar(frame:.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteBackgroud
        view.addSubview(navBar)
        setupNavBar()
    }
    private func setupNavBar() {
        navBar.translatesAutoresizingMaskIntoConstraints = false
        let item = UINavigationItem()
        item.titleView = UIImageView(image: UIImage(named: "Luncheon logo"))
        navBar.items = [item]
        
        NSLayoutConstraint.activate([
            navBar.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            navBar.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
        ])
    }

}
