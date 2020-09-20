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
    private let chefImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "chef"))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    private let timeToCookView:TimeToCookView = TimeToCookView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteBackgroud
        view.addSubview(navBar)
        setupNavBar()
        
        self.view.addSubview(orderStatus)
        setupOrderStatusVC()
        
        // add chef
        self.view.addSubview(chefImage)
        setupChefImage()
        
        // add timeToCockView
        self.view.addSubview(timeToCookView)
        setupTimeToCookView()
    }
    override func viewDidAppear(_ animated: Bool) {
        debugPrint("appeared")
//        timeToCookView.startTimer(value: 13602)
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
    private func setupChefImage(){
        NSLayoutConstraint.activate([
            chefImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            chefImage.topAnchor.constraint(equalTo: orderStatus.bottomAnchor, constant: 32),
            chefImage.widthAnchor.constraint(equalToConstant: 200),
            chefImage.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    private func setupTimeToCookView() {
        timeToCookView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeToCookView.topAnchor.constraint(equalTo: chefImage.bottomAnchor, constant: -8),
            timeToCookView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            timeToCookView.heightAnchor.constraint(equalToConstant: 80),
            timeToCookView.widthAnchor.constraint(equalToConstant: 320),
        ])
    }
}
