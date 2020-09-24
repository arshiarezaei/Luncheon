//
//  InvoiceTableViewCell.swift
//  Luncheon
//
//  Created by arshiya on 9/23/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class InvoiceTableViewCell: UITableViewCell {
    
    private let invoiceItemLabel:UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .right
        l.font = UIFont.BYekan
        l.text = "invoiceItemTitle"
        return l
    }()
    
    private let invoiceItemPriceLabel:UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .right
        l.font = UIFont.BYekan
        l.text = "value"
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        debugPrint("ss")
        // add InvoiceItemLabel
        self.addSubview(invoiceItemLabel)
        setupInvoiceItemLabel()
        
        self.addSubview(invoiceItemPriceLabel)
        setupInvoiceItemPriceLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(title:String,value:Int) {
        invoiceItemLabel.text = title
        invoiceItemPriceLabel.text = "\(value)  تومان "
    }
    
    private func setupInvoiceItemLabel() {
        NSLayoutConstraint.activate([
            invoiceItemLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            invoiceItemLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
        ])
    }
    private func setupInvoiceItemPriceLabel() {
        NSLayoutConstraint.activate([
            invoiceItemPriceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            invoiceItemPriceLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 8),
        ])
    }
    
}
