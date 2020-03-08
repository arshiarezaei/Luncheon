//
//  EnterVerificationCodeVC.swift
//  Luncheon
//
//  Created by Arshiya on 12/17/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class EnterVerificationCodeVC: UIViewController {
    
    private let luncheonLogo:UIImageView = UIImageView(image: UIImage(named: "Luncheon logo"))
    
    private let askToVerificationCodeLabel:UILabel = UILabel(frame: .zero)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .whiteBackgroud
        
        self.view.addSubview(luncheonLogo)
        setupLuncheonLogo()
        
        self.view.addSubview(askToVerificationCodeLabel)
        setupAskToEnterVerificationCodeLabel()
        
    }
    
    
    private func setupLuncheonLogo() {
        luncheonLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            luncheonLogo.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 70),
            luncheonLogo.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            luncheonLogo.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 78.0),
            luncheonLogo.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 78.0),
        ])
    }
    
    
    
    
    private func setupAskToEnterVerificationCodeLabel() {
        askToVerificationCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        askToVerificationCodeLabel.text = "یک کد برای شما پیامک شده است لطفا آن را وارد کنید"
        askToVerificationCodeLabel.font = UIFont(name: UIFont.BYekanName, size: 16)
        askToVerificationCodeLabel.textAlignment = .center
        askToVerificationCodeLabel.semanticContentAttribute = .forceRightToLeft
        
        
        
        NSLayoutConstraint.activate([
            askToVerificationCodeLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: luncheonLogo.bottomAnchor, constant:20),
            askToVerificationCodeLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
        ])
        
        
    }
    
    
    
}


//        self.navigationItem.title = ""
//        self.navigationItem.backBarButtonItem?.title = "بازگشت"
//        self.view.backgroundColor = .red
//        self.navigationItem.title = "sss"
//        self.navigationItem.backBarButtonItem?.title = "بازگشت"
//        navigationController?.navigationBar.backItem?.backBarButtonItem?.isEnabled = false
//        navigationController?.navigationBar.isUserInteractionEnabled = false
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem
