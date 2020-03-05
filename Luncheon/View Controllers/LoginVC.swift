//
//  LoginVC.swift
//  Luncheon
//
//  Created by Arshiya on 12/10/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    private let closeButton:UIButton = UIButton(frame: .zero)
    private let loginView : LoginView = LoginView(frame: .zero)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(closeButton)
        self.setupCloseButton()
        
        self.view.addSubview(loginView)
        setupLoginView()
        self.view.bringSubviewToFront(closeButton)
        // Do any additional setup after loading the view.
    }
    
    
    private func setupCloseButton() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        
        
        
        NSLayoutConstraint.activate([
            closeButton.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: 16),
            closeButton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 16),
            closeButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16),
        ])
    }
    private func setupLoginView() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            loginView.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            loginView.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
        ])
        
    }
    @objc func closeButtonTapped(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
