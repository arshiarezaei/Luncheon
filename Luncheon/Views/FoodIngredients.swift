//
//  FoodIngredients.swift
//  Luncheon
//
//  Created by arshiya on 10/22/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class FoodIngredients: UIView {
    
    private let title:UILabel = {
        var t = UILabel(frame: .zero)
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont(name: "BYekan+", size: 15)
        t.textAlignment = .right
        t.semanticContentAttribute = .forceRightToLeft
        t.numberOfLines = 1
        t.textColor = .luncheonBalck
        t.text = "توضیحات"
        return t
    }()

    private let ingredients:UILabel = {
        var t = UILabel(frame: .zero)
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont(name: "BYekan+", size: 15)
        t.textAlignment = .right
        t.semanticContentAttribute = .forceRightToLeft
        t.numberOfLines = 1
        t.textColor = .luncheonBalck
        t.text = "اینجا برای نوشتن توضیحات"
        return t
        
    }()
    private lazy var titleconstraints:[NSLayoutConstraint] = [
        title.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
        title.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16)
    ]
    
    private lazy var ingredientsConstraints:[NSLayoutConstraint] = [
        title.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 16),
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        title.widthAnchor.constraint(equalTo: self.widthAnchor),
    ]

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(title)
        NSLayoutConstraint.activate(titleconstraints)
        
        self.addSubview(ingredients)
        NSLayoutConstraint.activate(ingredientsConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
