//
//  FollowUpVC.swift
//  Luncheon
//
//  Created by Arshiya on 12/15/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class FollowUpVC: UIViewController {
    private let scrollView:UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .green
        return sv
    }()
    private let navBar : UINavigationBar = UINavigationBar(frame:.zero)
    private let orderStatus:OrderStatusView = OrderStatusView()
    private let chefImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "chef"))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    private let timeToCookView:TimeToCookView = TimeToCookView()
    private let invoiceTVC = InvoiceTableViewController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteBackgroud
        view.addSubview(navBar)
        setupNavBar()
        
        view.addSubview(self.scrollView)
        setupScrollView()

        
        self.scrollView.addSubview(orderStatus)
        setupOrderStatusVC()

        // add chef
        self.scrollView.addSubview(chefImage)
        setupChefImage()

        // add timeToCockView
        self.scrollView.addSubview(timeToCookView)
        setupTimeToCookView()

        // add invoiceTable
        addChild(invoiceTVC)
        scrollView.addSubview(invoiceTVC.view)
        invoiceTVC.didMove(toParent: self)
        setupInvoiceTVC()

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
    private func setupScrollView(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.navBar.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    private func setupOrderStatusVC() {
        orderStatus.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orderStatus.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            orderStatus.topAnchor.constraint(equalTo: scrollView.topAnchor),
            orderStatus.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            orderStatus.heightAnchor.constraint(equalToConstant: 90),
        ])
    }
    private func setupChefImage(){
        NSLayoutConstraint.activate([
            chefImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            chefImage.topAnchor.constraint(equalTo: orderStatus.bottomAnchor, constant: 32),
            chefImage.widthAnchor.constraint(equalToConstant: 200),
            chefImage.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    private func setupTimeToCookView() {
        timeToCookView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeToCookView.topAnchor.constraint(equalTo: chefImage.bottomAnchor, constant: -8),
            timeToCookView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            timeToCookView.heightAnchor.constraint(equalToConstant: 80),
            timeToCookView.widthAnchor.constraint(equalToConstant: 320),
        ])
    }
    private func setupInvoiceTVC() {
        invoiceTVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            invoiceTVC.view.topAnchor.constraint(equalTo: timeToCookView.bottomAnchor,constant: 32),
            invoiceTVC.view.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            invoiceTVC.view.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.9),
            invoiceTVC.view.heightAnchor.constraint(equalToConstant:CGFloat(invoiceTVC.tableView.numberOfRows(inSection: 0))*invoiceTVC.tableView.rowHeight),
            invoiceTVC.view.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        ])
    }
}
