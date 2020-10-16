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
        sv.backgroundColor = .whiteBackgroud
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
    
    private lazy var blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
    private lazy var blurEffectView = UIVisualEffectView(effect: blurEffect)
    private lazy var loginALert:LoginAlertView = LoginAlertView(frame: .zero)
    
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

        NotificationCenter.default.addObserver(self, selector: #selector(removeBlurEffectView), name: .userLoggedIn, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(removeBlurEffectView), name: .userProfileRecevied, object: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //MARK: prototype
        if !SampleUser.getStatus{
            self.view.isUserInteractionEnabled = false
            view.addSubview(blurEffectView)
            setupBlurView()
            blurEffectView.contentView.addSubview(loginALert)
            setupLoginAlert()
        }
        // MARK: uncomment the following code function for working version of Luncheon
        /*
        if UserStates.currentState == .LoggedOut {
            debugPrint("logged out ")
            self.view.isUserInteractionEnabled = false
            view.addSubview(blurEffectView)
            setupBlurView()
            blurEffectView.contentView.addSubview(loginALert)
            setupLoginAlert()
        }*/
    }
    override func viewDidAppear(_ animated: Bool) {

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
    private func setupLoginAlert()  {
        loginALert.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginALert.centerXAnchor.constraint(equalTo: blurEffectView.contentView.centerXAnchor),
            loginALert.centerYAnchor.constraint(equalTo: blurEffectView.contentView.centerYAnchor,constant: -100),
//            loginALert.heightAnchor.constraint(equalToConstant: 100),
            loginALert.widthAnchor.constraint(equalTo: blurEffectView.contentView.widthAnchor,multiplier: 0.9),
        ])
    }
    private func  setupBlurView()  {
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurEffectView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            blurEffectView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            blurEffectView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    @objc private func removeBlurEffectView() {
        blurEffectView.removeFromSuperview()
        loginALert.removeFromSuperview()
        self.view.isUserInteractionEnabled = true
    }
}
