//
//  PreviousOrdersCell.swift
//  Luncheon
//
//  Created by arshiya on 10/26/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class PreviousOrdersCell: UITableViewCell {
    
    private var restaurants:UILabel = {
        var l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .right
        l.font = UIFont.BYekan
        l.text = "اسم رستوران ها"
        l.textColor = .luncheonGray
        return l
    }()
    
    private lazy var restaurantsConstraints:[NSLayoutConstraint] = [
        restaurants.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        restaurants.centerXAnchor.constraint(equalTo: self.centerXAnchor),
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(restaurants)
        NSLayoutConstraint.activate(restaurantsConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContent(text:String) {
        restaurants.text = text
    }

}
