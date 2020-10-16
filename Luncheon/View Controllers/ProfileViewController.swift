//
//  ProfileViewController.swift
//  Luncheon
//
//  Created by Arshiya on 12/9/1398 AP.
//  Copyright © 1398 AP ir.luncheon. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var loginOrSignUpView:LoginOrSignUpView = LoginOrSignUpView(frame: .zero)
    private var profileView : ProfileView?
    private lazy var acitivityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserStates.currentState == .LoggedOut ? setupLoginOrSignUpView() : userLoggedIn()
        view.backgroundColor = .whiteBackgroud
        NotificationCenter.default.addObserver(self, selector: #selector(userLoggedIn), name: .userLoggedIn, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(userLoggedout), name: .userLoggedOut, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(userProfileReceived), name: .userProfileRecevied, object: nil)
        
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "بازگشت"
        backBarBtnItem.tintColor = .luncehonLogoText
        navigationItem.backBarButtonItem = backBarBtnItem
    }
    @objc private func setupLoginOrSignUpView() {
        debugPrint("class ProfileViewController->setupLoginOrSignUpView ")
        view.addSubview(loginOrSignUpView)
        loginOrSignUpView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginOrSignUpView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            loginOrSignUpView.heightAnchor.constraint(equalTo:self.view.heightAnchor),
            loginOrSignUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginOrSignUpView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
        
    }
    
    private func setupProfileView() {
        debugPrint("setupProfileView")
        profileView!.translatesAutoresizingMaskIntoConstraints = false
        profileView!.backgroundColor = UIColor.whiteBackgroud
        NSLayoutConstraint.activate([
            profileView!.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            profileView!.heightAnchor.constraint(equalTo:self.view.heightAnchor),
            profileView!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            profileView!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    @objc private func userLoggedIn()  {
        debugPrint("ProfileViewController user Logeed in")
        loginOrSignUpView.removeFromSuperview()
        acitivityIndicator.frame.size  = CGSize(width: 100, height: 100)
        acitivityIndicator.center = self.view.center
        self.view.addSubview(acitivityIndicator)
//        acitivityIndicator.startAnimating()
        
        //        view.addSubview(profileView)
        //        setupProfileView()
        
    }
    @objc private func userLoggedout()  {
        debugPrint("ProfileViewController user Logeed out")
        profileView?.removeFromSuperview()
        view.addSubview(loginOrSignUpView)
        setupLoginOrSignUpView()
        
    }
    @objc private func userProfileReceived(){
        acitivityIndicator.stopAnimating()
        acitivityIndicator.removeFromSuperview()
        profileView = ProfileView(frame: .zero)
        view.addSubview(profileView!)
        setupProfileView()
    }
    @objc func increaseButtonTapped() {
        debugPrint("IncreaseButtonTapped")
    }
}
