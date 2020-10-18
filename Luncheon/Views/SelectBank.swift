//
//  SelectBank.swift
//  Luncheon
//
//  Created by arshiya on 10/14/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class SelectBank: UIView {
    
    private let selectBankLabel:UILabel = {
        let sbl = UILabel(frame: .zero)
        sbl.translatesAutoresizingMaskIntoConstraints = false
        sbl.text = "لطفا بانک خود را انتخاب کنید"
        sbl.font = UIFont(name: UIFont.BYekan.fontName, size: 20)
        sbl.textColor = .luncheonBalck
        sbl.semanticContentAttribute = .forceRightToLeft
        sbl.textAlignment = .center
        return sbl
    }()
    
    private let bankMellat:UIButton = {
        let bm = UIButton(frame: .zero)
        bm.translatesAutoresizingMaskIntoConstraints = false
        bm.setImage(UIImage(named: "bank-mellat"), for: .normal)
        return bm
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(selectBankLabel)
        setupSelectBankLabelConstraints()
        
        self.addSubview(bankMellat)
        setupBankMellatConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelectBankLabelConstraints() {
        NSLayoutConstraint.activate([
            selectBankLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            selectBankLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 0),
        ])
    }
    private func setupBankMellatConstraints(){
        NSLayoutConstraint.activate([
            bankMellat.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bankMellat.topAnchor.constraint(equalTo: selectBankLabel.bottomAnchor,constant: 0),
            bankMellat.widthAnchor.constraint(equalToConstant: 60),
            bankMellat.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
