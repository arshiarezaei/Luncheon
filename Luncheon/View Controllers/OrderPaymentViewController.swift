//
//  OrderPaymentViewController.swift
//  Luncheon
//
//  Created by arshiya on 10/10/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class OrderPaymentViewController: UIViewController {
    
    private let payOrderfromCredit:PayOrderFromCreditView = {
        var pofc = PayOrderFromCreditView(frame: .zero)
        pofc.translatesAutoresizingMaskIntoConstraints = false
        pofc.layer.cornerRadius = 16
        pofc.layer.borderWidth = 2
        pofc.layer.borderColor = UIColor.whiteBorder.cgColor
        pofc.backgroundColor = .white
        return pofc
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .whiteBackgroud
        
        
        // add payOrderfromCredit
        self.view.addSubview(payOrderfromCredit)
        setupPayOrderfromCreditConstraints()
        
    }
    
    private func setupPayOrderfromCreditConstraints() {
        NSLayoutConstraint.activate([
            payOrderfromCredit.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.8),
            payOrderfromCredit.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            payOrderfromCredit.heightAnchor.constraint(equalToConstant: 100),
            payOrderfromCredit.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 32),
        ])
    }
}

