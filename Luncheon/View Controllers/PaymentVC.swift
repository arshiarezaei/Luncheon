//
//  PaymentVC.swift
//  Luncheon
//
//  Created by Arshiya on 1/11/1399 AP.
//  Copyright © 1399 AP ir.luncheon. All rights reserved.
//

import UIKit
import WebKit

class PaymentVC: UIViewController,WKNavigationDelegate{
    
    private var web: WKWebView?
    
    private var closeButton:UIButton = {
        let cb  = UIButton(frame: .zero)
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setImage(UIImage(named: "close"), for: .normal)
        return cb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.view.addSubview(closeButton)
        setupCloseButton()
    }
    override func loadView() {
        super.loadView()
        web = WKWebView(frame: .zero)
        web?.allowsBackForwardNavigationGestures = true
        self.view = web
        web?.navigationDelegate = self

        
   }
    private func setupCloseButton() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .allEvents)
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 32),
            closeButton.heightAnchor.constraint(equalToConstant: 32),
            closeButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32),
            closeButton.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -8)
        ])
        
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true,completion: nil)
    }
    func loadURL(url:URL) {
    web?.load(URLRequest(url: url))
        
    }
    


}
