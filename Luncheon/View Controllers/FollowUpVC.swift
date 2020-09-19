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
    private let orderStatus:OrderStatusView = OrderStatusView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteBackgroud
        view.addSubview(navBar)
        setupNavBar()
        
        self.view.addSubview(orderStatus)
        setupOrderStatusVC()
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
    private func setupOrderStatusVC() {
        orderStatus.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orderStatus.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            orderStatus.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            orderStatus.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            orderStatus.heightAnchor.constraint(equalToConstant: 90),
        ])
    }
    
}
