//
//  FoodTrayViewController.swift
//  Luncheon
//
//  Created by arshiya on 10/5/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class FoodTrayViewController: UIViewController {

    private let closeButton:UIButton = {
       var cb =  UIButton(frame: .zero)
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setImage(UIImage(named: "close"), for: .normal)
        cb.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        return cb
    }()
    private let luncheonLogo:UIImageView = {
        var logo = UIImageView(image: UIImage(named: "Luncheon logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let foodtrayLabel:UILabel = {
        var ftb = UILabel(frame: .zero)
        ftb.translatesAutoresizingMaskIntoConstraints = false
        ftb.semanticContentAttribute = .forceRightToLeft
        ftb.contentMode = .center
        ftb.textColor = .luncheonDarkBalck
        ftb.font = UIFont(name: UIFont.BYekan.fontName, size: 30)
        ftb.text = "سینی غذا"
        return ftb
    }()

    private var foodTrayItem = [DropDownMenu]()
    private var payOrderButton:UIButton = {
        var pob = UIButton(frame: .zero)
        pob.translatesAutoresizingMaskIntoConstraints = false
        pob.backgroundColor = .luncehonLogoText
        pob.layer.cornerRadius = 16
        pob.setTitle("پرداخت", for: .normal)
        pob.titleLabel?.font = UIFont(name: UIFont.BYekan.fontName, size: 30)
        pob.addTarget(self, action: #selector(payOrderButtonTapped(_:)), for: .touchUpInside)
        return pob
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .whiteBackgroud
        
        // Do any additional setup after loading the view.
        
        // close button
        self.view.addSubview(closeButton)
        setupCloseButton()

        // luncheon logo
        self.view.addSubview(luncheonLogo)
        setupLuncheonLogo()
        
        // foodtray lable
        self.view.addSubview(foodtrayLabel)
        setupFoodTrayLabel()
        
        // MARK: test purpose
        let k = Array(SampleFoodTray.foodTray.keys).sorted()
        for restaurants in k {
            foodTrayItem.append(DropDownMenu(frame: .zero,title:"اسم رستوران",index:restaurants))
        }
        self.view.addSubview(foodTrayItem[0])
        seutpFoodTrayItem()
        
        
//        foodTrayItem.append(DropDownMenu(frame: .zero,title:"اسم رستوران",index:k[0]))


//        foodTrayItem.append(DropDownMenu(frame: .zero,title:"اسم رستوران 2",index:1))
//        self.view.addSubview(foodTrayItem[1])
//        
//        NSLayoutConstraint.activate([
//            foodTrayItem[1].topAnchor.constraint(equalTo: foodTrayItem[0].bottomA,constant: 32),
//            foodTrayItem[1].centerXAnchor.constraint(equalTo: foodTrayItem[0].centerXAnchor),
//            foodTrayItem[1].widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.8),
//            foodTrayItem[1].heightAnchor.constraint(equalToConstant: 60),
//        ])
        
        self.view.addSubview(payOrderButton)
        setupPayOrderButtonConstraints()
    }
    
    private func setupCloseButton() {
        NSLayoutConstraint.activate([
            closeButton.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 29),
            closeButton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 29),
            closeButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16),
        ])
    }
    private func setupLuncheonLogo() {
        NSLayoutConstraint.activate([
            luncheonLogo.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 40),
            luncheonLogo.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 40),
            luncheonLogo.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            luncheonLogo.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16),
        ])
    }
    private func setupFoodTrayLabel() {
        NSLayoutConstraint.activate([
            foodtrayLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            foodtrayLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    private func seutpFoodTrayItem(){
        NSLayoutConstraint.activate([
            foodTrayItem[0].topAnchor.constraint(equalTo: self.view.topAnchor,constant: 120),
            foodTrayItem[0].centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            foodTrayItem[0].widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.8),
            foodTrayItem[0].heightAnchor.constraint(greaterThanOrEqualToConstant: 65),
        ])
    }
    @objc private func closeButtonTapped(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func payOrderButtonTapped(_ sender:UIButton) {
        debugPrint("payorderButtonTapped")
        self.dismiss(animated: true, completion: nil)
        self.view.superview?.window?.rootViewController?.present(OrderPaymentViewController(), animated: true, completion: nil)
    }
    private func setupPayOrderButtonConstraints(){
        NSLayoutConstraint.activate([
            payOrderButton.topAnchor.constraint(equalTo: foodTrayItem[foodTrayItem.count-1].bottomA,constant: 32),
            payOrderButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            payOrderButton.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.8),
            payOrderButton.heightAnchor.constraint(equalToConstant: 65 )
            
        ])
    }
    
    func moveView(index:Int) {
        self.view.setNeedsLayout()
    }
    
    

}
