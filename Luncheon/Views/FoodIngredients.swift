//
//  FoodIngredients.swift
//  Luncheon
//
//  Created by arshiya on 10/22/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class FoodIngredients: UIView {
    
    
    public  var height:NSLayoutDimension {
        get{
            return ingredients.heightAnchor
        }
    }
    
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
        t.contentMode = .top
        t.semanticContentAttribute = .forceRightToLeft
        t.numberOfLines = 0
        t.textColor = .luncheonBalck
        return t
        
    }()
    private lazy var titleconstraints:[NSLayoutConstraint] = [
        title.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
        title.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16)
    ]
    
    private lazy var ingredientsConstraints:[NSLayoutConstraint] = [
        ingredients.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 4),
        ingredients.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ingredients.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        ingredients.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
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
    
    func setIngredients(text:[String]) {
        var ing = ""
        for i in text {
            ing.append("\(i) , ")
        }
        ingredients.text = ing

    }
    
}
