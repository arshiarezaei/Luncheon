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
    private lazy var profileView : ProfileView = ProfileView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserStates.currentState == .LoggedOut ? setupLoginOrSignUpView() : userLoggedIn()
        view.backgroundColor = .whiteBackgroud
        NotificationCenter.default.addObserver(self, selector: #selector(userLoggedIn), name: .userLoggedIn, object: nil)
    }
    func setupLoginOrSignUpView() {
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
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = UIColor.whiteBackgroud
        NSLayoutConstraint.activate([
            profileView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            profileView.heightAnchor.constraint(equalTo:self.view.heightAnchor),
            profileView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            profileView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    @objc private func userLoggedIn()  {
        debugPrint("ProfileViewController user Logeed in")
        view.addSubview(profileView)
        setupProfileView()
        Network.getCurrentUserProfile()
    }
}
